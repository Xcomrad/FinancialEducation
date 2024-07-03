
import UIKit

class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: 20.0, height: 20.0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
