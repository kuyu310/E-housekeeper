
//
//  ADViewController.swift
//  广告页面
//  E-housekeeper
//
//  Created by limeng on 2017/3/1.
//  Copyright © 2017年 limeng. All rights reserved.
//
import UIKit

class ADViewController: UIViewController {
    
    fileprivate lazy var backImageView: UIImageView = {
        let backImageView = UIImageView()
        backImageView.frame = ScreenBounds
        return backImageView
        }()
    
    var imageName: String? {
        didSet {
            var placeholderImageName: String?
            switch UIDevice.currentDeviceScreenMeasurement() {
            case 3.5:
                placeholderImageName = "iphone4"
            case 4.0:
                placeholderImageName = "iphone5"
            case 4.7:
                placeholderImageName = "iphone6"
//            case 5.5:
//                placeholderImageName = "iphone6p"
            default:
                placeholderImageName = "iphone6s"
            }
            //limeng
            
            ///Users/limeng/Desktop/xydyqgj/xydyqgj/AD/ADViewController.swift:28:13: Ambiguous use of 'sd_setImage'
//            这个函数在swift3里面有变化，必须添加options才行，不然会报错。
           
            backImageView.sd_setImage(with: URL(string: imageName!), placeholderImage: UIImage(named: placeholderImageName!), options: SDWebImageOptions() , completed: {
                (image: UIImage?, error: Error?, _, _) -> Void in
                if error != nil {
                    //加载广告失败
                    print("加载广告失败")
                    NotificationCenter.default.post(name: Notification.Name(rawValue: ADImageLoadFail), object: nil)
                }
                
                if image != nil {
                    let time = DispatchTime.now() + Double(Int64(1.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                    DispatchQueue.main.asyncAfter(deadline: time, execute: { () -> Void in
                        
                        UIApplication.shared.setStatusBarHidden(false, with: UIStatusBarAnimation.fade)
                        
                        let time1 = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                        DispatchQueue.main.asyncAfter(deadline: time1, execute: { () -> Void in
                         NotificationCenter.default.post(name: Notification.Name(rawValue: ADImageLoadSecussed), object: image)
                        })
                        
                    })
                } else {
                    //加载广告失败
                    print("加载广告失败")
                    NotificationCenter.default.post(name: Notification.Name(rawValue: ADImageLoadFail), object: nil)
                }
            })
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backImageView)
        UIApplication.shared.setStatusBarHidden(true, with: UIStatusBarAnimation.none)
    }
}
