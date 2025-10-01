import Foundation
import Combine

// This class will manage our data locally for now.
class LocalDataManager {
    static let shared = LocalDataManager()

    @Published var professionals: [Professional] = []

    // When we save, we just add to our local array.
    func save(professional: Professional) {
        professionals.append(professional)
    }

    // When we fetch, we just return the local array.
    func fetchProfessionals() -> [Professional] {
        return professionals
    }
}
