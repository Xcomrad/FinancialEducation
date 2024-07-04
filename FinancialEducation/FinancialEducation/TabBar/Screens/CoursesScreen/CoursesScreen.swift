
import UIKit

final class CoursesScreen: UIViewController {
    
    private let courseManager = CoursesManager()
    private var courses: [Course] = []
    
    private let rootView = CoursesScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courses = courseManager.fetchCourses()
        update()
        rootView.onSelectedCourse = { course in
            self.openDetailCourse(course)
        }
    }
     
    //MARK: - Update
    func update() {
        rootView.update(courses)
    }
    
    //MARK: - Action
    func openDetailCourse(_ selectedCourse: Course) {
            let controller = DetailCourseScreen()
            controller.selectedCourse = selectedCourse
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(controller, animated: true)
 
        }
}
