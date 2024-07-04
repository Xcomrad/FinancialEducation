
import UIKit

class CourseCell: UICollectionViewCell {
    
    static var reuseId = "CourseCell"
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var subititleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
    func update(_ course: Course) {
        courseImageView.image = UIImage(named: "\(course.image)")
        titleLabel.text = course.title
        subititleLabel.text = course.subtitle
    }
}



extension CourseCell {
    
    func setup() {
        backgroundColor = .darkColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.borderColor.cgColor
        layer.cornerRadius = 20
    }
    
    func setupViews() {
        addSubview(courseImageView)
        addSubview(titleLabel)
        addSubview(subititleLabel)
    }
    
    func setupConstraints() {
    
        courseImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(courseImageView.snp.bottom).inset(-5)
            make.leading.trailing.equalTo(self).inset(20)
        }
        
        subititleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalTo(titleLabel)
        }
    }
}
