
import UIKit

class FavoritesScreenVC: UIViewController {
    
    private var quotes: [Quote] = []
    
    private let rootView = FavoritesScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotes = FavoritesService.shared.loadFavorites()
        update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.tableView.reloadData()
    }
    
    //MARK: - Update
    private func update() {
        rootView.update(quotes)
    }
}
