import SwiftUI
import CloudKit // This is the line that was missing.

struct RegistrationFormView: View {
    // This allows other views to close this sheet.
    @Environment(\.dismiss) var dismiss
    
    @State private var companyName: String = ""
    @State private var yearsOfExperience: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section("Professional Details") {
                    TextField("Company Name", text: $companyName)
                    TextField("Years of Experience", text: $yearsOfExperience)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Register as Professional")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        Task {
                            await saveProfessionalProfile()
                        }
                    }
                }
            }
        }
    }
    
    // This function will save the data to CloudKit.
    func saveProfessionalProfile() async {
        // "Professional" is the table name in your database.
        let record = CKRecord(recordType: "Professional")
        record["companyName"] = companyName
        record["yearsOfExperience"] = yearsOfExperience
        
        do {
            try await CloudKitManager.shared.save(record: record)
            print("✅ Professional profile saved successfully!")
            dismiss() // Close the form on success.
        } catch {
            print("❌ Error saving profile: \(error.localizedDescription)")
        }
    }
}
