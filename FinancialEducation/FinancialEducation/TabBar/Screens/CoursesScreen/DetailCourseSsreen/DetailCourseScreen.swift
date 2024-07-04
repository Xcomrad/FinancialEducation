
import UIKit

final class DetailCourseScreen: UIViewController {
    
    var currentCourse: Course?
    
    private let rootView = DetailCourseView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Теория"
    }
    
    //MARK: - Public
    func update() {
        rootView.update(currentCourse!)
    }
}
