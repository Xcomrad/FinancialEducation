
import UIKit

class DetailView: UIView {
    
    let dismissButton = ClouseButton()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fin")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.borderColor.cgColor
        imageView.layer.borderWidth = 1
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
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
    
    //MARK: - Update
    func update(_ currentCourse: Course) {
        courseImageView.image = UIImage(named: "\(currentCourse.image)")
        titleLabel.text = currentCourse.title
        descriptionLabel.text = currentCourse.description
    }
}



extension DetailView {
    
    private func setup() {
        backgroundColor = .darkColor
        layer.cornerRadius = 20
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        scrollView.addSubview(dismissButton)
        
        verticalStackView.addArrangedSubview(courseImageView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        courseImageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStackView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStackView).inset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(verticalStackView).inset(10)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.top.right.equalTo(verticalStackView).inset(20)
        }
    }
}
