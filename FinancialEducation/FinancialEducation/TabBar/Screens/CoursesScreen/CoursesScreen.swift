
import UIKit

final class CoursesScreen: UIViewController {
    
    private let rootView = CoursesScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openDetailCourse()
    }
    
    
    func openDetailCourse() {
        rootView.completionShowCourseDetail = {
            let controller = DetailCourseScreen()
            self.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
