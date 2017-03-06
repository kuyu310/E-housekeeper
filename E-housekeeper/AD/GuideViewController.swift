

import UIKit

class GuideViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.setStatusBarHidden(false, with: UIStatusBarAnimation.none)
        // 静态引导页
//        setStaticGuidePage()
        // 动态引导页
        setDynamicGuidePage()
        
        // 视频引导页
//        setVideoGuidePage()
    }
    
    
    //MARK - 设置APP静态图片引导页
      fileprivate func setStaticGuidePage() {
    
        let imageNameArray = ["guideImage1.jpg", "guideImage2.jpg", "guideImage3.jpg", "guideImage4.jpg" ,"guideImage5.jpg"]
            let guidePage:DHGuidePageHUD = DHGuidePageHUD(frame: ScreenBounds)
            guidePage.dh_init(withFrame: ScreenBounds, imageNameArray: imageNameArray, buttonIsHidden:true)
            guidePage.slideInto = true;
            self.navigationController?.view.addSubview(guidePage)
    }
    
    //MARK - 设置APP动态图片引导页
    fileprivate func setDynamicGuidePage() {
        
        let imageNameArray = ["guideImage6.gif", "guideImage7.gif", "guideImage8.gif"]
        let guidePage  = DHGuidePageHUD(frame: ScreenBounds)
        guidePage.dh_init(withFrame: ScreenBounds, imageNameArray: imageNameArray, buttonIsHidden:true)
        guidePage.slideInto = true;
        self.navigationController?.view.addSubview(guidePage)
        
    }
    
    
    //MARK - 设置APP视频引导页
    fileprivate func setVideoGuidePage() {
        let videoURL = URL.init(fileURLWithPath: Bundle.main.path(forResource: "guideMovie1", ofType: "mov")!)
        //靠他大爷的，这个要提前分配下frame，不然你找不到北的。！！！！！
        
        let guidePage:DHGuidePageHUD = DHGuidePageHUD(frame: ScreenBounds)
        guidePage.dh_init(withFrame: ScreenBounds, videoURL: videoURL)
        guidePage.slideInto = true;
        self.navigationController?.view.addSubview(guidePage)
        
    }
    


}


