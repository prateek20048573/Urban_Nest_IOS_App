import CloudKit
import Foundation

struct Professional: Identifiable {
    let id: String
    let companyName: String
    let yearsOfExperience: String

    // This allows us to easily create a Professional object from a CloudKit record.
    init?(from record: CKRecord) {
        guard let companyName = record["companyName"] as? String,
              let yearsOfExperience = record["yearsOfExperience"] as? String else {
            return nil
        }

        self.id = record.recordID.recordName
        self.companyName = companyName
        self.yearsOfExperience = yearsOfExperience
    }
}
