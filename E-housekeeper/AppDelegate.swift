//
//  AppDelegate.swift
//  E-housekeeper
//
//  Created by limeng on 2017/3/1.
//  Copyright © 2017年 limeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var adViewController: ADViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        添加消息中心消息
        addNotification()
        
        
        
        WXAppConfiguration.setAppGroup("授权棒银企管家")
        WXAppConfiguration.setAppName("授权棒银企管家")
        WXAppConfiguration.setAppVersion("1.0.0")
        
        
        WXLog.setLogLevel(WXLogLevel.all)
        
        // register event module
        WXSDKEngine.registerModule("event", with: NSClassFromString("WXEventModule"))
        
        // register handler，注册协议，这个协议是load image的协议，weex并没有实现远程图片加载，需要自己实现这个协议
        WXSDKEngine.registerHandler(WXImageLoaderDefaultImplement(), with:NSProtocolFromString("WXImgLoaderProtocol"))
        
        //init WeexSDK
        WXSDKEngine.initSDKEnvironment()
        // 注册地图组件，高德地图
        WXSDKEngine.registerComponent("map", with: WXMapComponent.self)
        
//        let viewController:MainViewController = MainViewController()
//        viewController.url = URL.init(string: String.init(format: "file://%@/bundlejs/index.js", Bundle.main.bundlePath))
//
        
        
        buildKeyWindow()
        
        
        return true
    }

    // MARK: - Public Method
    fileprivate func buildKeyWindow() {
        
        window = UIWindow(frame: ScreenBounds)
        window!.makeKeyAndVisible()
        
        let isFristOpen = UserDefaults.standard.object(forKey: "isFristOpenApp")
        //UserDefaults 适合存储轻量级的本地客户端数据，比如记住密码功能，要保存一个系统的用户名、密码。使用 UserDefaults 是首选
        if isFristOpen == nil {
            window?.rootViewController = GuideViewController()

            UserDefaults.standard.set("isFristOpenApp", forKey: "isFristOpenApp")
        } else {
            
            loadADRootViewController()
        }
    }
    
    


    
    
    
    func loadADRootViewController() {
        
        adViewController = ADViewController()
        
        weak var tmpSelf = self
        //从json文件中加载相关数据
        MainAD.loadADData { (data, error) -> Void in
            if data?.data?.img_name != nil {
                tmpSelf!.adViewController!.imageName = data!.data!.img_name
                tmpSelf!.window?.rootViewController = self.adViewController
            }
        }
        
        
    }

    
    
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.showMainTabbarControllerSucess(_:)), name: NSNotification.Name(rawValue: ADImageLoadSecussed), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.showMainTabbarControllerFale), name: NSNotification.Name(rawValue: ADImageLoadFail), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.shoMainTabBarController), name: NSNotification.Name(rawValue: GuideViewControllerDidFinish), object: nil)
    }

    func showMainTabbarControllerSucess(_ noti: Notification) {
        let adImage = noti.object as! UIImage
        let mainViewController = MainViewController()
       
        
        mainViewController.url = URL.init(string: String.init(format: "file://%@/bundlejs/index.js", Bundle.main.bundlePath))
        

        window?.rootViewController = mainViewController
    }

    func showMainTabbarControllerFale() {
        let mainViewController = MainViewController()

         mainViewController.url = URL.init(string: String.init(format: "file://%@/bundlejs/index.js", Bundle.main.bundlePath))
        window!.rootViewController = mainViewController
    }
    
    func shoMainTabBarController() {
        let mainViewController = MainViewController()
        
        mainViewController.url = URL.init(string: String.init(format: "file://%@/bundlejs/index.js", Bundle.main.bundlePath))

        window!.rootViewController = mainViewController
    }

    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

