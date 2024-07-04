
import Foundation

struct Quiz {
    let image: String
    let title: String
    let questions: [QuizQuestion]
}

struct QuizQuestion {
    let question: String
    let answers: [String]
    let correctAnswer: String
}
