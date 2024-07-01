
import UIKit

class HelloScreenView: UIView {
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Улучшайте ваши знания о финансовом мире: \n Проходите тесты, Решайте задачи, Делайте заметки."
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .whiteColor
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Знание финансовой грамотности позволяет контролировать свой бюджет, управлять долгами и расходами, находить возможности для увеличения доходов и расширения бизнеса."
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
    }()
    
    private lazy var continueButton: UIButton = {
       let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = .tupColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(openMainScreen), for: .touchUpInside)
        return button
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
    
    // MARK: Action
    @objc func openMainScreen() {
        
    }
}



extension HelloScreenView {
    
    func setup() {
        backgroundColor = .backgroundColor
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(continueButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(100)
            make.leading.trailing.equalTo(self).inset(20)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.leading.trailing.equalTo(titleLabel)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).inset(-50)
            make.leading.trailing.equalTo(subtitleLabel).inset(50)
            make.height.equalTo(50)
        }
    }
}
