
import UIKit

class CourseCell: UICollectionViewCell {
    
    static var reuseId = "CourseCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "econ")
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Знакомство с финансами"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var subititleLabel: UILabel = {
        let label = UILabel()
        label.text = "Базовая база, которую обязан знять каждый, чтобы не только сохранить свои деньги, но и приумножить!"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
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
    
    func setup() {
        backgroundColor = .darkColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.borderColor.cgColor
        layer.cornerRadius = 20
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subititleLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-5)
            make.leading.trailing.equalTo(self).inset(20)
        }
        
        subititleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalTo(titleLabel)
        }
    }
}
