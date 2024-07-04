
import UIKit

final class QuizzesScreenVC: UIViewController {
    
    private let dataManager = QuizeQuestionManager()
    private var quizzes: [Quiz] = []
    
    private let rootView = QuizeScreenView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchQuizzes()
        update()
        
        rootView.onOpenQuize = { quiz in
            self.openQuize(quiz)
        }
    }
    
    func fetchQuizzes() {
        quizzes = dataManager.fetchQuizQuestion()
    }
    
    //MARK: - Update
    func update() {
        rootView.update(quizzes)
    }
    
    //MARK: - Action
    func openQuize(_ currentQuize: Quiz) {
        let controller = DetailQuizzeVC()
        controller.quiz = currentQuize
        navigationController?.pushViewController(controller, animated: true)
    }
}



