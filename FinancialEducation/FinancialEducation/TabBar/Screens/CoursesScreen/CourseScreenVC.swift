
import UIKit

final class CourseScreenVC: UIViewController {
    
    private let courseManager = CoursesManager()
    private var courses: [Course] = []
    
    private let rootView = CoursesScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCourses()
        
        rootView.onSelectedCourse = { course in
            self.openDetail(course)
        }
        
        rootView.update(courses)

    }
    
    private func fetchCourses() {
        courses = courseManager.fetchCourses()
    }
    
    //MARK: - Action
    private func openDetail(_ selectedCourse: Course) {
        let controller = DetailCourseVC()
        controller.currentCourse = selectedCourse
        modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}
