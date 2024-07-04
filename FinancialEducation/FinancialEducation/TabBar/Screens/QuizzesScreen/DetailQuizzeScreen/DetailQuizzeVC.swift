
import UIKit

final class DetailQuizzeVC: UIViewController {
    
    var quiz: Quiz?
    
    var currentQuestionIndex = 0
    var correctAnswersCount = 0
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var answerButtons: [UIButton] = {
        var buttons = [UIButton]()
        for _ in 0..<4 {
            let button = UIButton()
            button.backgroundColor = .darkColor
            button.layer.borderColor = UIColor.tupColor.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 20
            button.setTitleColor(.whiteColor, for: .normal)
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(answerTapped), for: .touchUpInside)
            buttons.append(button)
        }
        return buttons
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLayout()
        showQuestion()
    }
    
    private func showQuestion() {
        guard let quiz = quiz, currentQuestionIndex < quiz.questions.count else {
            showResults()
            return
        }
        
        let currentQuestion = quiz.questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(currentQuestion.answers[index], for: .normal)
        }
    }
    
    //MARK: - Action
    @objc private func answerTapped(_ sender: UIButton) {
        guard let answer = sender.currentTitle, let quiz = quiz else { return }
        let currentQuestion = quiz.questions[currentQuestionIndex]
        
        if answer == currentQuestion.correctAnswer {
            sender.backgroundColor = .systemGreen
            correctAnswersCount += 1
        } else {
            sender.backgroundColor = .systemRed
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentQuestionIndex += 1
            self.resetButtons()
            self.showQuestion()
        }
    }
    
    private func resetButtons() {
        for button in answerButtons {
            button.backgroundColor = .darkColor
        }
    }
    
    private func showResults() {
        let alertController = UIAlertController(title: "Тест завершен", message: "У вас \(correctAnswersCount) правильных ответов на \(quiz?.questions.count ?? 0) вопросов!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Oк", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}



extension DetailQuizzeVC {
    
    func setup() {
        view.backgroundColor = .backgroundColor
    }
    
    private func setupLayout() {
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        for (index, button) in answerButtons.enumerated() {
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.equalTo(questionLabel.snp.bottom).offset(20 + (index * 50))
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(44)
            }
        }
    }
}

