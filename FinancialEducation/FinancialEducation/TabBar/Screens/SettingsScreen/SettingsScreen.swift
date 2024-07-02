
import UIKit

class SettingsScreen: UIViewController {
    
    private let rootView = SettingsScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
    }
}
