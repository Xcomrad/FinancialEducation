
import Foundation

struct Quote: Codable, Equatable {
    let title: String
    let autor: String
    
    static func == (lhs: Quote, rhs: Quote) -> Bool {
            return lhs.title == rhs.title && lhs.autor == rhs.autor
        }
}
