
import UIKit

class CourseTitleCell: UITableViewCell {
    
    static let reuseId = "CourseTitleView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "sdasf"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
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
        titleLabel.text = data.title
    }
}



extension CourseTitleCell {
    
    func setupView() {
        titleLabel.addSubview(contentView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
