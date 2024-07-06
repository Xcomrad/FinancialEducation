
import UIKit

class QuotesScreenView: UIView {
    
    private var quotes: [Quote] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .backgroundColor
        tableView.layer.cornerRadius = 20
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(QuoteCell.self, forCellReuseIdentifier: QuoteCell.reuseId)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(_ quotes: [Quote]) {
        self.quotes = quotes
    }
    
    func isFavorite(_ quote: Quote) -> Bool {
        return FavoritesService.shared.loadFavorites().contains(where: {$0.title == quote.title && $0.autor == quote.autor })
    }
}



extension QuotesScreenView:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteCell.reuseId, for: indexPath) as! QuoteCell
        let data = quotes[indexPath.row]
        cell.update(data, isFavorite(data))
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
       }
}



extension QuotesScreenView: QuoteCellDelegate {
    
    func didPressButton(_ cell: QuoteCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let quote = quotes[indexPath.row]
        if isFavorite(quote) {
            FavoritesService.shared.removeFavorite(quote)
        } else {
            FavoritesService.shared.saveFavorite(quote)
        }
        tableView.reloadData()
    }
}



extension QuotesScreenView {
    
    private func setupView() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}


