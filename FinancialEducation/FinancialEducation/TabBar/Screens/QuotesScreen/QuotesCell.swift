
import UIKit

protocol QuoteCellDelegate: AnyObject {
    func didPressButton(_ cell: QuoteCell)
}

class QuoteCell: UITableViewCell {
    
    static var reuseId = "QuoteCell"
    
    weak var delegate: QuoteCellDelegate?
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
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
    func update(_ quote: Quote, _ isFavorite: Bool) {
        quoteLabel.text = quote.title
        authorLabel.text = "- \(quote.autor)"
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    //MARK: - Action
    @objc private func favoriteTapped() {
        UIView.animate(withDuration: 0.3) {
            self.favoriteButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.favoriteButton.transform = CGAffineTransform.identity
            }
        }
        delegate?.didPressButton(self)
    }
}



extension QuoteCell {
    
    private func setup() {
        backgroundColor = .darkColor
        layer.cornerRadius = 20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.borderColor.cgColor
    }
    
    private func setupViews() {
        contentView.addSubview(quoteLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        
        quoteLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(quoteLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).inset(-15)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}
