
import UIKit

final class ClouseButton: UIView {
    
    var onCloseDetail: (()->())?
    
    private lazy var clouseButton: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium)
        let arrowImage = UIImage(systemName: "chevron.down.circle", withConfiguration: largeConfig)
        button.setImage(arrowImage, for: .normal)
        button.tintColor = .tupColor        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTarget()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension ClouseButton {
    
   private func setupTarget() {
       clouseButton.addTarget(self, action: #selector(closeScreen(sender:)), for: .touchUpInside)
    }
    
    private func setupViews() {
        self.addSubview(clouseButton)
    }
    
    private func setupConstraints() {
        clouseButton.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    // MARK: - Action
    @objc func closeScreen(sender: UIButton) {
        self.onCloseDetail?()
    }
}
