
import UIKit

class CourseDescriptionCell: UITableViewCell {
    
    static let reuseId = "CourseTitleView"
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
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
        descriptionLabel.text = data.description
    }
}



extension CourseDescriptionCell {
    
    func setupView() {
        descriptionLabel.addSubview(contentView)
    }
    
    func setupConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
