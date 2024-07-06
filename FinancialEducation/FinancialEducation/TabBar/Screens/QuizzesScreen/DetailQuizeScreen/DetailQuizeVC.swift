
import UIKit

final class DetailQuizVC: UIViewController {
    
    var quiz: Quiz?
    private var currentQuestionIndex = 0
    private var correctAnswersCount = 0
    
    private let rootView = DetailQuizeView()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTupped()
    }
}



extension DetailQuizVC {
    
    //MARK: - Actions
    private func buttonTupped() {
        rootView.onButtonTupped = { [weak self] selectedButton in
            guard let self = self, let answer = selectedButton.currentTitle, let quiz = self.quiz else { return }
            
            if answer == quiz.questions[self.currentQuestionIndex].correctAnswer {
                selectedButton.backgroundColor = .systemGreen
                self.correctAnswersCount += 1
            } else {
                selectedButton.backgroundColor = .systemRed
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.nextQuestion()
            }
        }
        self.showQuestion()
    }
    
    private func nextQuestion() {
        self.currentQuestionIndex += 1
        
        if self.currentQuestionIndex < (quiz?.questions.count ?? 0) {
            self.resetButtonColors()
            self.showQuestion()
        } else {
            self.showResults()
        }
    }
    
    private func resetButtonColors() {
        rootView.answerButtons.forEach { $0.backgroundColor = .darkColor }
    }
    
    private func showQuestion() {
        guard let quiz = quiz else { return }
        let currentQuestion = quiz.questions[currentQuestionIndex]
        rootView.questionLabel.text = currentQuestion.question
        for (index, button) in rootView.answerButtons.enumerated() {
            if index < currentQuestion.answers.count {
                button.setTitle(currentQuestion.answers[index], for: .normal)
                button.isHidden = false
            } else {
                button.isHidden = true
            }
        }
    }
    
    private func showResults() {
        let totalQuestions = quiz?.questions.count ?? 0
        let message = "У вас \(correctAnswersCount) правильных ответов на \(totalQuestions) вопросов!"
        let alert = UIAlertController(title: "Тест завершен", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Oк", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true, completion: nil)
    }
}
