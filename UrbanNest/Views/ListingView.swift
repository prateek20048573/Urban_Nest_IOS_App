import SwiftUI
import PhotosUI
import CloudKit

struct ListingView: View {
    @State private var title: String = ""
    @State private var location: String = ""
    @State private var price: String = ""
    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var isSaving = false
    @State private var showingSuccessAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section("Property Details") {
                    TextField("Property Title (e.g., Modern Loft)", text: $title)
                    TextField("Location (e.g., London, UK)", text: $location)
                    TextField("Price per night", text: $price)
                        .keyboardType(.numberPad)
                }

                Section("Property Photo") {
                    PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                        if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                            Image(uiImage: uiImage).resizable().scaledToFill()
                                .frame(height: 200).clipped().listRowInsets(EdgeInsets())
                        } else {
                            Label("Select a Photo", systemImage: "photo.on.rectangle.angled")
                        }
                    }
                    .frame(height: 200)
                }

                Section {
                    if isSaving {
                        HStack { Spacer(); ProgressView(); Spacer() }
                    } else {
                        Button("List My Property") {
                            Task { await saveProperty() }
                        }
                        .disabled(formIsInvalid)
                    }
                }
            }
            .navigationTitle("List a Property")
            .onChange(of: selectedPhotoItem) {
                Task {
                    if let data = try? await selectedPhotoItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            .alert("Success!", isPresented: $showingSuccessAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Your property has been listed successfully.")
            }
        }
    }

    var formIsInvalid: Bool {
        title.isEmpty || location.isEmpty || price.isEmpty || selectedImageData == nil
    }

    private func saveProperty() async {
        guard let priceInt = Int(price), let imageData = selectedImageData else { return }
        isSaving = true

        let propertyRecord = CKRecord(recordType: "Property")
        propertyRecord["title"] = title
        propertyRecord["location"] = location
        propertyRecord["pricePerNight"] = priceInt

        do {
            let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(UUID().uuidString).appendingPathExtension("jpg")
            try imageData.write(to: tempURL)
            let imageAsset = CKAsset(fileURL: tempURL)
            propertyRecord["image"] = imageAsset

            try await CloudKitManager.shared.save(record: propertyRecord)
            print("✅ Property listed successfully!")
            showingSuccessAlert = true
            resetForm()
        } catch {
            print("❌ Error saving property: \(error.localizedDescription)")
        }
        isSaving = false
    }

    private func resetForm() {
        title = ""; location = ""; price = ""; selectedImageData = nil; selectedPhotoItem = nil
    }
}
