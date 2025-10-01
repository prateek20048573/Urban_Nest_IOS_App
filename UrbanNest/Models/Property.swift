import CloudKit
import SwiftUI

struct Property: Identifiable, Equatable {
    let id: String
    let title: String
    let location: String
    let pricePerNight: Int
    let imageAsset: CKAsset?

    // This helper converts the CloudKit image data into a displayable image.
    var image: UIImage? {
        guard let asset = imageAsset,
              let url = asset.fileURL,
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        return UIImage(data: data)
    }

    // This is the special initializer that your ViewModel needs.
    // It teaches the Property model how to be created from a database record.
    init?(from record: CKRecord) {
        guard let title = record["title"] as? String,
              let location = record["location"] as? String,
              let pricePerNight = record["pricePerNight"] as? Int else {
            return nil
        }

        self.id = record.recordID.recordName
        self.title = title
        self.location = location
        self.pricePerNight = pricePerNight
        self.imageAsset = record["image"] as? CKAsset
    }
}

//import CloudKit
//import SwiftUI
//
//struct Property: Identifiable {
//    let id: String
//    let title: String
//    let location: String
//    let pricePerNight: Int
//    let imageAsset: CKAsset?
//
//    var image: UIImage? {
//        guard let asset = imageAsset,
//              let url = asset.fileURL,
//              let data = try? Data(contentsOf: url) else {
//            return nil
//        }
//        return UIImage(data: data)
//    }
//
//    init?(from record: CKRecord) {
//        guard let title = record["title"] as? String,
//              let location = record["location"] as? String,
//              let pricePerNight = record["pricePerNight"] as? Int else {
//            return nil
//        }
//
//        self.id = record.recordID.recordName
//        self.title = title
//        self.location = location
//        self.pricePerNight = pricePerNight
//        self.imageAsset = record["image"] as? CKAsset
//    }
//}
