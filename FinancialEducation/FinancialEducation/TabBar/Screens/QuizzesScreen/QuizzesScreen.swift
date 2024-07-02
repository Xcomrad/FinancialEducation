
import UIKit

final class QuizzesScreen: UIViewController {
    
    private let rootView = QuizzesScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Тесты"
    }
}
