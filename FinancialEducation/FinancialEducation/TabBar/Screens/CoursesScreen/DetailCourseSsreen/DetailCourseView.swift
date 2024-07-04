
import UIKit

class DetailCourseView: UIView {
    
    private var selectedCourse: Course?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.borderColor.cgColor
        imageView.layer.borderWidth = 0.5
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
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(_ selectedCourse: Course) {
        //self.selectedCourse = selectedCourse
        courseImageView.image = UIImage(named: "\(selectedCourse.image)")
        titleLabel.text = selectedCourse.title
        descriptionLabel.text = selectedCourse.description
    }
}



extension DetailCourseView {
    
    func setup() {
        backgroundColor = .darkColor
        layer.cornerRadius = 20
    }
    
    func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addArrangedSubview(courseImageView)
        contentView.addArrangedSubview(titleLabel)
        contentView.addArrangedSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        courseImageView.snp.makeConstraints { make in
            make.width.equalTo(contentView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(20)
        }
    }
}


