
import UIKit

final class LoadScreenView: UIView {
    
 private let circleView = CircleView()
    
    lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Загрузка..."
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.textColor = .whiteColor
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Пожалуйста, подождите несколько секунд, \n пока приложение загрузится."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .textColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension LoadScreenView {
    
    func setup() {
        backgroundColor = .backgroundColor
    }
    
    func setupViews() {
        addSubview(circleView)
        addSubview(loadingLabel)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        
        circleView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalTo(self).inset(100)
            make.width.height.equalTo(200)
        }
        
        loadingLabel.snp.makeConstraints { make in
            make.top.equalTo(circleView.snp.top).inset(250)
            make.leading.trailing.equalTo(self).inset(20)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(loadingLabel).inset(50)
            make.leading.trailing.equalTo(self).inset(20)
        }
    }
}
