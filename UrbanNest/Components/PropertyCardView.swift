import SwiftUI

struct PropertyCardView: View {
    let property: Property

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // This now checks for the 'image' property from the CloudKit model.
            if let uiImage = property.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 280, height: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                // Show a placeholder if no image exists.
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 260)
                    .padding()
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Text(property.location).font(.headline).fontWeight(.bold)
            Text(property.title).font(.subheadline).foregroundStyle(.secondary)
            HStack {
                Text("$\(property.pricePerNight)").fontWeight(.bold)
                Text("night")
            }
            .font(.subheadline)
        }
        .frame(width: 280)
    }
}

//import SwiftUI
//
//struct PropertyCardView: View {
//    // This will be passed in from the RealEstateView
//    let property: Property
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            // Check if the property has a valid image.
//            if let uiImage = property.image {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 280, height: 260)
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//            } else {
//                // Show a placeholder if no image exists.
//                Image(systemName: "photo.on.rectangle.angled")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 280, height: 260)
//                    .padding()
//                    .background(Color(.systemGray5))
//                    .clipShape(RoundedRectangle(cornerRadius: 12))
//            }
//
//            Text(property.location).font(.headline).fontWeight(.bold)
//            Text(property.title).font(.subheadline).foregroundStyle(.secondary)
//            HStack {
//                Text("$\(property.pricePerNight)").fontWeight(.bold)
//                Text("night")
//            }
//            .font(.subheadline)
//        }
//        .frame(width: 280)
//    }
//}
