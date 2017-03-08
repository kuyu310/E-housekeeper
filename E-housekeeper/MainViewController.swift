//
//  ViewController.swift
//  E-housekeeper
//
//  Created by limeng on 2017/3/1.
//  Copyright © 2017年 limeng. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController ,UIGestureRecognizerDelegate{

    var instance:WXSDKInstance?;
    var weexView = UIView()
    var weexHeight:CGFloat?;
    var top:CGFloat?;
    var url:URL?;
    
    let baby = BabyBluetooth.share();
    let testPeripleralName = "JDY-08";
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
//      self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        
        render()
        
//搜索蓝牙设备
        DiscoverToPeripherals()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }


    deinit {
        if instance != nil {
            instance!.destroy()
        }
    }
    
//  发现蓝牙设备
    func DiscoverToPeripherals(){
       

        //设置查找Peripherals的规则
        baby?.setFilterOnDiscoverPeripherals { (name, adv, RSSi) -> Bool in
            if let name = adv?["kCBAdvDataLocalName"] as? String {
                if name == self.testPeripleralName as String {
                    return true;
                }
                
            }
            return false
        }
        //        设置连接Peripherals的规则
        //        kCBAdvDataLocalName是广播包中的固定名称，是蓝牙模块的规则名称
        baby?.setFilterOnConnectToPeripherals { (name, adv, RSSI) -> Bool in
            if let name = adv?["kCBAdvDataLocalName"] as? String {
                if (name == self.testPeripleralName){
                    return true;
                }
                
            }
            return false;
        }

        //        找到Peripherals的block
        baby?.setBlockOnDiscoverToPeripherals { (centralManager, peripheral, adv, RSSI) in
            print("%@", centralManager);
        };
        
        //        连接Peripherals成功的block
        baby?.setBlockOnConnected { (centralManager, peripheral) in
            print("connect on :\(peripheral?.name)");
            SVProgressHUD.show(withStatus: peripheral?.name)
        };
        //        设置查找服务的block
        baby?.setBlockOnDiscoverServices { (p, error) in
            print("discover services:\(p?.services)");
        }
        //        设置查找到Characteristics的block
        baby?.setBlockOnDiscoverCharacteristics { (p, s, err) in
            print("discover characteristics:\(s?.characteristics) on uuid \(s?.uuid.uuidString)");
        }
        
        baby?.scanForPeripherals().enjoy();
        
    }
 
    
    func render(){
        if instance != nil {
            instance!.destroy()
        }
        instance = WXSDKInstance();
        instance!.viewController = self
        let width = self.view.frame.size.width
        
        instance!.frame = CGRect(x: 0, y: NavigationH, width: width, height: self.view.frame.size.height)
        weak var weakSelf:MainViewController? = self
        
       
        instance?.onCreate = {
            (view:UIView?)-> Void in
            weakSelf!.weexView.removeFromSuperview()
            weakSelf!.weexView = view!;
            weakSelf!.view.addSubview(self.weexView)
            UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf!.weexView)
        }
        
        instance?.onFailed = {
            (error:Error?)-> Void in
            
            print("faild at error: %@", error!)
        }
        
        instance?.renderFinish = {
            (view:UIView?)-> Void in
            print("render finish")
        }
        instance?.updateFinish = {
            (view:UIView?)-> Void in
            print("update finish")
        }
        
        instance!.render(with: url!, options: ["bundleUrl":String.init(format: "file://%@/bundlejs/", Bundle.main.bundlePath)], data: nil)
    }
    
    
}

