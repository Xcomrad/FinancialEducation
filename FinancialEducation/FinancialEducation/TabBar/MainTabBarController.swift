
import UIKit
import SnapKit

final class MainTabBarController: UITabBarController {
        
    private let courcesVC: UINavigationController = {
        let controller = CoursesScreen()
        let title = "Курсы"
        let image = UIImage(systemName: "graduationcap.fill")
        let tag = 0
        let tabItem = UITabBarItem(title: title, image: image, tag: tag)
        
        controller.tabBarItem = tabItem
        controller.navigationItem.title = "Курсы"
        controller.navigationItem.largeTitleDisplayMode = .always
        
        let navScreen = UINavigationController(rootViewController: controller)
        navScreen.navigationBar.barStyle = .black
        navScreen.navigationBar.prefersLargeTitles = true
        navScreen.navigationBar.isTranslucent = false
        return navScreen
    }()
    
    private let quizzesVC: UINavigationController = {
        let controller = QuizzesScreen()
        let title = "Тесты"
        let image = UIImage(systemName: "checkmark.rectangle.fill")
        let tag = 1
        let tabItem = UITabBarItem(title: title, image: image, tag: tag)
        
        controller.tabBarItem = tabItem
        controller.navigationItem.title = "Tесты"
        controller.navigationItem.largeTitleDisplayMode = .always
        
        let navQuizess = UINavigationController(rootViewController: controller)
        navQuizess.navigationBar.barStyle = .black
        navQuizess.navigationBar.prefersLargeTitles = true
        navQuizess.navigationBar.isTranslucent = false
        return navQuizess
    }()
    
    private let settingsVC: UINavigationController = {
        let controller = SettingsScreen()
        let title = "Настройки"
        let image = UIImage(systemName: "gearshape.fill")
        let tag = 2
        let tabItem = UITabBarItem(title: title, image: image, tag: tag)
        
        controller.tabBarItem = tabItem
        controller.navigationItem.title = "Tесты"
        controller.navigationItem.largeTitleDisplayMode = .always
        
        let navSettings = UINavigationController(rootViewController: controller)
        navSettings.navigationBar.barStyle = .black
        navSettings.navigationBar.prefersLargeTitles = true
        navSettings.navigationBar.isTranslucent = false
        return navSettings
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [courcesVC, quizzesVC, settingsVC]
        setupStyle()
    }
    
    private func setupStyle() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .darkColor
        tabBar.backgroundColor = .darkColor
        tabBar.tintColor = .tupColor
        tabBar.unselectedItemTintColor = .textColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.cornerRadius = 20
        tabBar.layer.borderColor = UIColor.darkColor.cgColor
        tabBar.clipsToBounds = true
    }
}

