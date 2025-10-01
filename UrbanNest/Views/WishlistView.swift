import SwiftUI

struct WishlistView: View {
    @EnvironmentObject var wishlistManager: WishlistManager

    var body: some View {
        NavigationView {
            VStack {
                if wishlistManager.wishlistedProperties.isEmpty {
                    VStack {
                        Image(systemName: "heart.slash")
                            .font(.largeTitle)
                        Text("No Wishlisted Items")
                            .font(.headline)
                            .padding(.top)
                        Text("Tap the heart on any property to save it here.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                } else {
                    // Users can save favorite properties, professionals, or services for later.
                    List(wishlistManager.wishlistedProperties) { property in
                        HStack(spacing: 16) {
                            if let uiImage = property.image {
                                Image(uiImage: uiImage).resizable().scaledToFill()
                                    .frame(width: 60, height: 60).clipShape(RoundedRectangle(cornerRadius: 8))
                            } else {
                                Image(systemName: "photo").frame(width: 60, height: 60)
                                    .background(Color(.systemGray5)).clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            VStack(alignment: .leading) {
                                Text(property.title).font(.headline)
                                Text(property.location).font(.subheadline).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Wishlists")
        }
    }
}
