
import UIKit

class DetailQuizeView: UIView {
    
    var onButtonTupped: ((UIButton)->())?
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var answerButtons: [UIButton] = {
        var buttons = [UIButton]()
        for _ in 0..<4 {
            let button = UIButton()
            button.backgroundColor = .darkColor
            button.layer.borderColor = UIColor.tupColor.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 20
            button.setTitleColor(.whiteColor, for: .normal)
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(answerTapped(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        return buttons
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc func answerTapped(_ sender: UIButton) {
        onButtonTupped?(sender)
    }
}



extension DetailQuizeView {
    
    private func setup() {
        backgroundColor = .backgroundColor
    }
    
    private func setupView() {
        addSubview(questionLabel)
    }
    
    private func setupConstraints() {
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        for (index, button) in answerButtons.enumerated() {
            addSubview(button)
            button.snp.makeConstraints { make in
                make.top.equalTo(questionLabel.snp.bottom).offset(20 + (index * 50))
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(44)
            }
        }
    }
}
