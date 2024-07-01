
import UIKit

class LoadScreen: UIViewController {
    
    private let rootView = LoadScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            var controller = HelloScreen()
            var window = UIWindow.init(frame: UIScreen.main.bounds)
            window.rootViewController = controller
            window.makeKeyAndVisible()
            
        }
    }
}

