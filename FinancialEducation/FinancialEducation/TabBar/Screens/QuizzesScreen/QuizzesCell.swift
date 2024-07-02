
import UIKit

class QuizzesCell: UITableViewCell {
    
    static let reuseId = "QuizzesCell"
    
    private lazy var testImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fin")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let verticalSackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "10 вопросов"
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var subititleLabel: UILabel = {
        let label = UILabel()
        label.text = "Проверим базовые знания"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .thin, scale: .medium)
        let arrowImage = UIImage(systemName: "arrow.right.circle", withConfiguration: largeConfig)
        button.setImage(arrowImage, for: .normal)
        button.tintColor = .tupColor
        button.addTarget(self, action: #selector(showDetailTest), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action
    @objc func showDetailTest() {
        
    }
}



extension QuizzesCell {
    
    func setup() {
        backgroundColor = .darckColor
        layer.cornerRadius = 30
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.borderColor.cgColor
    }
    
    func setupViews() {
        addSubview(testImageView)
        addSubview(titleLabel)
        
        addSubview(verticalSackView)
        verticalSackView.addArrangedSubview(titleLabel)
        verticalSackView.addArrangedSubview(subititleLabel)
        
        addSubview(continueButton)
    }
    
    func setupConstraints() {
        testImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(self)
            make.height.width.equalTo(100)
        }
        
        verticalSackView.snp.makeConstraints { make in
            make.leading.equalTo(testImageView.snp.trailing).inset(-10)
            make.width.equalTo(200)
            make.top.bottom.equalTo(self).inset(10)
        }
        
        continueButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalTo(self).inset(10)
        }
    }
}
