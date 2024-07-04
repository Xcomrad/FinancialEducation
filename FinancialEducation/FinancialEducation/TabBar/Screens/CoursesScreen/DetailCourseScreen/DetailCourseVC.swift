
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
        
        rootView.dismissButton.onCloseDetail = {
            self.dismiss(animated: true)
        }
        
    }
    
    //MARK: - Update
    func update() {
        rootView.update(currentCourse!)
    }
    
    func setup() {
        title = "Теория"
    }
}
