
import UIKit

class QuizzesCell: UITableViewCell {
    
    static let reuseId = "QuizzesCell"
    
    private lazy var testImageView: UIImageView = {
        let imageView = RoundedImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var subititleLabel: UILabel = {
        let label = UILabel()
        label.text = "Проверим базовые знания"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
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
    
    //MARK: - Update
    func update(_ quize: QuizModel) {
        testImageView.image = UIImage(named: "\(quize.image)")
        titleLabel.text = "\(quize.questions.count) вопросов"
        subititleLabel.text = quize.title
    }
}



extension QuizzesCell {
    
    func setup() {
        backgroundColor = .darkColor
        layer.cornerRadius = 20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.borderColor.cgColor
    }
    
    func setupViews() {
        addSubview(testImageView)
        addSubview(titleLabel)
        addSubview(subititleLabel)
        addSubview(continueButton)
    }
    
    func setupConstraints() {
        testImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalTo(self)
            make.height.equalTo(100)
            make.width.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).inset(10)
            make.leading.equalTo(testImageView.snp.trailing).inset(-10)
            make.trailing.equalTo(continueButton.snp.leading).inset(200)
        }
        
        subititleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.equalTo(testImageView.snp.trailing).inset(-10)
            make.width.equalTo(170)
        }
        
        
        continueButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalTo(self).inset(10)
        }
    }
}

