
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
    private func update() {
        rootView.update(currentCourse!)
    }
    
    private func setup() {
        title = "Теория"
    }
}
