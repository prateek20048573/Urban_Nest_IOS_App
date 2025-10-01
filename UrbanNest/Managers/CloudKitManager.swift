import CloudKit
import SwiftUI

class CloudKitManager {
    // A singleton to ensure we only have one instance of this manager.
    static let shared = CloudKitManager()

    // This function saves a record to the public CloudKit database.
    func save(record: CKRecord) async throws {
        let publicDB = CKContainer.default().publicCloudDatabase
        try await publicDB.save(record)
    }

    // This is the new function to fetch records from the database.
    // It can fetch any type of record, making it reusable and professional.
    func fetch(recordType: String) async throws -> [CKRecord] {
        let publicDB = CKContainer.default().publicCloudDatabase
        // The predicate "NSPredicate(value: true)" means "fetch all records of this type".
        let query = CKQuery(recordType: recordType, predicate: NSPredicate(value: true))
        
        // This modern async/await function fetches the records that match the query.
        let (results, _) = try await publicDB.records(matching: query)
        
        // We need to extract the actual CKRecord objects from the results tuple.
        return results.compactMap { try? $0.1.get() }
    }
}
