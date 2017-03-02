//
//  ViewController.swift
//  E-housekeeper
//
//  Created by limeng on 2017/3/1.
//  Copyright © 2017年 limeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIGestureRecognizerDelegate{

    var instance:WXSDKInstance?;
    var weexView = UIView()
    var weexHeight:CGFloat?;
    var top:CGFloat?;
    var url:URL?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        
       
        
        
        render()

        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    deinit {
        if instance != nil {
            instance!.destroy()
        }
    }
    
  
    
 
    
    func render(){
        if instance != nil {
            instance!.destroy()
        }
        instance = WXSDKInstance();
        instance!.viewController = self
        let width = self.view.frame.size.width
        
        instance!.frame = CGRect(x: 0, y: 0, width: width, height: self.view.frame.size.height)
        weak var weakSelf:ViewController? = self
        
        //        instance?.onCreate
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
        
        instance!.render(with: url, options: ["bundleUrl":String.init(format: "file://%@/bundlejs/", Bundle.main.bundlePath)], data: nil)
    }
    
    
}

