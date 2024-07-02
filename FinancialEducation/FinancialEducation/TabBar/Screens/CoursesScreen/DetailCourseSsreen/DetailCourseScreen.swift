
import UIKit

final class DetailCourseScreen: UIViewController {
    
    private let rootView = DetailCourseView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Теория"
    }
}
