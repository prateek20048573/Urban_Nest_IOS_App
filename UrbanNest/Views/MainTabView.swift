import SwiftUI

struct MainTabView: View {
    // Create the WishlistManager here so it's shared across all tabs.
    @StateObject private var wishlistManager = WishlistManager()

    var body: some View {
        TabView {
            RealEstateView()
                .tabItem { Image(systemName: "house.fill"); Text("Real Estate") }

            WishlistView()
                .tabItem { Image(systemName: "heart.fill"); Text("Wishlists") }

            ListingView()
                .tabItem { Image(systemName: "plus.app.fill"); Text("Listing") }

            MessagesView()
                .tabItem { Image(systemName: "message.fill"); Text("Messages") }

            ProfileView()
                .tabItem { Image(systemName: "person.circle.fill"); Text("Profile") }
        }
        // Make the wishlistManager available to all child views.
        .environmentObject(wishlistManager)
    }
}
