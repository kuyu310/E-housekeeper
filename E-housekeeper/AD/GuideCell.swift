

import UIKit

class GuideCell: UICollectionViewCell {
    
    fileprivate let newImageView = UIImageView(frame: ScreenBounds)
    fileprivate let nextButton = UIButton(frame: CGRect(x: (ScreenWidth - 100) * 0.5, y: ScreenHeight - 110, width: 100, height: 33))
    
    var newImage: UIImage? {
        didSet {
            newImageView.image = newImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        newImageView.contentMode = UIViewContentMode.scaleAspectFill
        contentView.addSubview(newImageView)
        
        nextButton.setBackgroundImage(UIImage(named: "icon_next"), for: UIControlState())
        nextButton.addTarget(self, action: #selector(GuideCell.nextButtonClick), for: UIControlEvents.touchUpInside)
        nextButton.isHidden = true
        contentView.addSubview(nextButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNextButtonHidden(_ hidden: Bool) {
        nextButton.isHidden = hidden
    }
    
    func nextButtonClick() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: GuideViewControllerDidFinish), object: nil)
    }
}
