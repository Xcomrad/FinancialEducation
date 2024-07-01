
import UIKit

final class HelloScreen: UIViewController {
    
    private let rootView = HelloScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.completionGoToMain = {
            
            UIApplication.shared.connectedScenes
                .compactMap { ( $0 as? UIWindowScene) }
                .forEach { windowScene in
                    windowScene.windows.forEach { window in
                        _ = window.rootViewController
                        UIView.transition(with: window, duration: 0, options: .transitionCrossDissolve, animations: {
                            window.rootViewController = MainTabBarController() })
                        
                    }
                }
        }
    }
}
