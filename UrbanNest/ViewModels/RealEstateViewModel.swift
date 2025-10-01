import Foundation
import Combine

@MainActor
class RealEstateViewModel: ObservableObject {

    @Published var properties: [Property] = []
    @Published var isLoading = false

    func fetchProperties() async {
        isLoading = true
        do {
            let records = try await CloudKitManager.shared.fetch(recordType: "Property")
            self.properties = records.compactMap(Property.init)
        } catch {
            print("❌ Error fetching properties: \(error.localizedDescription)")
        }
        isLoading = false
    }
}
