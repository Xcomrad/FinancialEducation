
import UIKit

class CourseImageCell: UITableViewCell {
    
    static let reuseId = "CourseImageView"
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fin")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = UIColor.borderColor.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(_ data: Course) {
        courseImageView.image = UIImage(named: "\(data.image)")
    }
}



extension CourseImageCell {
    
    func setupView() {
        courseImageView.addSubview(contentView)
    }
    
    func setupConstraints() {
        courseImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
