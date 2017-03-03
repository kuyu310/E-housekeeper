

import UIKit

class MainAD: NSObject, DictModelProtocol {
    var code: Int = -1
    var msg: String?
    var data: AD?
 
    
    class func loadADData(_ completion:(_ data: MainAD?, _ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource: "AD", ofType: nil)
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict, cls: MainAD.self) as? MainAD
            completion(data, nil)
        }
    }
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(AD.self)"]
    }
}

class AD: NSObject {
    var title: String?
    var img_name: String?
    var starttime: String?
    var endtime: String?
}
