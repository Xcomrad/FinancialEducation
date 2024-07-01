
import UIKit

final class LoadScreen: UIViewController {
    
    private let rootView = LoadScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIApplication.shared.connectedScenes
                .compactMap { ( $0 as? UIWindowScene) }
                .forEach { windowScene in
                    windowScene.windows.forEach { window in
                        _ = window.rootViewController
                        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: {
                            window.rootViewController = HelloScreen() })
                        
                    }
                }
        }
    }
}

