import SwiftUI

struct ProfessionalsView: View {
    @StateObject private var viewModel = ProfessionalsViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading Professionals...")
            } else if viewModel.professionals.isEmpty {
                Text("No professionals have registered yet.")
                    .foregroundStyle(.secondary)
            } else {
                // Once loaded, display the list of all registered professional members.
                List(viewModel.professionals) { professional in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(professional.companyName)
                            .font(.headline)
                        Text("\(professional.yearsOfExperience) years of experience")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Registered Professionals")
        .onAppear {
            Task {
                await viewModel.fetchProfessionals()
            }
        }
    }
}
