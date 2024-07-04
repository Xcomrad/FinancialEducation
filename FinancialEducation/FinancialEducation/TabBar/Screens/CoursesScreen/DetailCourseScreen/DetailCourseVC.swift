
import UIKit

final class DetailCourseVC: UIViewController {
    
    var currentCourse: Course?
    
    private let rootView = DetailView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        update()
        
    }
    
    //MARK: - Update
    func update() {
        rootView.update(currentCourse!)
    }
    
    func setup() {
        title = "Теория"
    }
}
