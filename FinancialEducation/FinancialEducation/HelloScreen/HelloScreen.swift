
import UIKit

class HelloScreen: UIViewController {
    
    private let rootView = HelloScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
