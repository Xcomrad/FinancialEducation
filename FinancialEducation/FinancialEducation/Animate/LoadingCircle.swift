
import UIKit

final class CircleView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    private let circleLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuoCircle()
        setupGradient()
        setupAnimate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   final func setupGradient() {
        gradientLayer.colors = [
            UIColor.whiteColor.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.tupColor.cgColor,
            UIColor.systemRed.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.purple.cgColor,
            UIColor.backgroundColor.cgColor,
        ]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(gradientLayer)
    }
    
    final func setuoCircle() {
        let circlePath = UIBezierPath(ovalIn: bounds)
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.black.cgColor
        circleLayer.lineWidth = 3
        gradientLayer.mask = circleLayer
    }
    
    final func setupAnimate() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2 * Double.pi
        rotationAnimation.duration = 3
        rotationAnimation.repeatCount = .infinity
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        circleLayer.frame = bounds
        let circlePath = UIBezierPath(ovalIn: bounds)
        circleLayer.path = circlePath.cgPath
    }
}
