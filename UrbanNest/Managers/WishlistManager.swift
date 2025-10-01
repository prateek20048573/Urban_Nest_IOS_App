import Foundation
import Combine

// This class will manage all wishlist logic.
// It's an ObservableObject so views can update when the wishlist changes.
class WishlistManager: ObservableObject {
    @Published var wishlistedProperties: [Property] = []

    func isWishlisted(property: Property) -> Bool {
        wishlistedProperties.contains { $0.id == property.id }
    }

    func toggleWishlist(for property: Property) {
        if isWishlisted(property: property) {
            // Remove the property if it's already wishlisted
            wishlistedProperties.removeAll { $0.id == property.id }
        } else {
            // Add the property if it's not
            wishlistedProperties.append(property)
        }
    }
}
