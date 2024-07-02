
import UIKit

final class CoursesScreen: UIViewController {
    
    private let rootView = CoursesScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.completionShowCourseDetail = {
            let controller = DetailCourseScreen()
            self.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
}
