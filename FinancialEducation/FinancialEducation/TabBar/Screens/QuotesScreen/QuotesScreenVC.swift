
import UIKit

class QuotesScreenVC: UIViewController {
    
    private let rootView = QuotesScreenView()
    
    private let quotesManager = QuotesManager()
    private var quotes: [Quote] = []
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        fetchQuotes()
        update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.reloadData()
    }
    
    func setupNavBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(openFavorites))
    }
    
    //MARK: - Action
    @objc func openFavorites() {
        let controller = FavoritesScreenVC()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func fetchQuotes() {
        quotes = quotesManager.fetchQuotes()
    }
    
    //MARK: - Update
    func update() {
        rootView.update(quotes)
    }
}
