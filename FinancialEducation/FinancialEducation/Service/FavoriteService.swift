
import Foundation

class FavoritesService {
    
    static let shared = FavoritesService()
    
    private let defaults = UserDefaults.standard
    private let favoritesKey = "favoritesKey"
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
  
    
    private init() {}
    
    func saveFavorite(_ quote: Quote) {
        var favorites = loadFavorites()
        if !favorites.contains(quote) {
            favorites.append(quote)
            saveFavorites(favorites)
        }
    }
    
    func loadFavorites() -> [Quote] {
        if let data = defaults.data(forKey: favoritesKey),
           let favorites = try? decoder.decode([Quote].self, from: data) {
            return favorites
        }
        return []
    }
    
    func removeFavorite(_ quote: Quote) {
        var favorites = loadFavorites()
        if let index = favorites.firstIndex(of: quote) {
            favorites.remove(at: index)
            saveFavorites(favorites)
        }
    }
    
    private func saveFavorites(_ favorites: [Quote]) {
        if let encoded = try? encoder.encode(favorites) {
            defaults.set(encoded, forKey: favoritesKey)
        }
    }
}

