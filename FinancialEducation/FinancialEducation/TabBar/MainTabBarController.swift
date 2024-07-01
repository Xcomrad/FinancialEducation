
import UIKit
import SnapKit

final class MainTabBarController: UITabBarController {
    
    func setupTabBarScreens() {
        
        let coursesScreen = CoursesScreen()
        coursesScreen.tabBarItem = UITabBarItem(title: "Курсы", image: UIImage(systemName: "graduationcap.fill"), tag: 0)
        
        let quizzesScreen = QuizzesScreen()
        quizzesScreen.tabBarItem = UITabBarItem(title: "Тесты", image: UIImage(systemName: "checkmark.rectangle.fill") , tag: 1)
        
        let settingsScreen = CoursesScreen()
        settingsScreen.tabBarItem = UITabBarItem(title: "Настройки", image: UIImage(systemName: "gearshape.fill"), tag: 2)
        
        viewControllers = [coursesScreen, quizzesScreen, settingsScreen]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarScreens()
        setupStyle()
    }
    
    private func setupStyle() {
        tabBar.backgroundColor = .darckColor
        tabBar.tintColor = .tupColor
        tabBar.unselectedItemTintColor = .textColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.cornerRadius = 20
        tabBar.layer.borderColor = UIColor.darckColor.cgColor
        tabBar.clipsToBounds = true
    }
}

