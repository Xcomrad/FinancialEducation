
import UIKit

class LoadScreen: UIViewController {
    
    private let rootView = LoadScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
