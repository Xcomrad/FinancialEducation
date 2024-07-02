
import UIKit

final class DetailQuizzeScreen: UIViewController {
    
    private let rootView = DetailCourseView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
