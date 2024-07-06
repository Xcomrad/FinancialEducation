
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
    
    private func fetchQuizzes() {
        quizzes = dataManager.fetchQuizQuestion()
    }
    
    //MARK: - Update
    private func update() {
        rootView.update(quizzes)
    }
    
    //MARK: - Action
    private func openQuize(_ currentQuize: Quiz) {
        let controller = DetailQuizVC()
        controller.quiz = currentQuize
        navigationController?.pushViewController(controller, animated: true)
    }
}



