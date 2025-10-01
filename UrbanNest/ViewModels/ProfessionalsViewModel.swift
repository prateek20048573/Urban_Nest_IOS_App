import Foundation
import Combine // Required for ObservableObject

@MainActor // Ensures UI updates happen on the main thread
class ProfessionalsViewModel: ObservableObject {

    @Published var professionals: [Professional] = []
    @Published var isLoading = false

    func fetchProfessionals() async {
        isLoading = true
        do {
            // 1. Call the CloudKitManager to fetch the raw records.
            let records = try await CloudKitManager.shared.fetch(recordType: "Professional")

            // 2. Convert the raw CKRecords into our clean Professional model.
            self.professionals = records.compactMap(Professional.init)

        } catch {
            print("❌ Error fetching professionals: \(error.localizedDescription)")
        }
        isLoading = false
    }
}
