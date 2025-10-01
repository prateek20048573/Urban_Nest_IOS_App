import SwiftUI

struct ProfileView: View {
    // MARK: - State
    
    @State private var isProfessionalAccount = false
    // This new variable will track when to show the registration form.
    @State private var isShowingRegistrationForm = false

    // MARK: - Body

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    // MARK: - Profile Header
                    VStack(spacing: 8) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundStyle(.secondary)

                        Text("Prateek Chawla")
                            .font(.title)
                            .fontWeight(.semibold)

                        Text("test.user@email.com")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    // MARK: - Conditional View for Professional Users
                    if isProfessionalAccount {
                        EarningsAndAnalyticsView()
                    } else {
                        // This now tells the button what to do when it's tapped.
                        ProfileActionsView(onRegisterTapped: { isShowingRegistrationForm = true })
                    }

                    // MARK: - Settings List
                    VStack(alignment: .leading) {
                        Text("Settings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        List {
                            Toggle("Enable Professional Account", isOn: $isProfessionalAccount.animation())
                            Label("Account Settings", systemImage: "gear")
                            Label("Get Help", systemImage: "questionmark.circle")
                            Label("Log Out", systemImage: "arrow.right.square")
                                .foregroundStyle(.red)
                        }
                        .listStyle(.inset)
                        .frame(height: 220)
                    }
                }
                .padding(.top)
                // This modifier presents the sheet when the state variable becomes true.
                .sheet(isPresented: $isShowingRegistrationForm) {
                    RegistrationFormView()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Reusable Components

// This view is updated to handle the button tap.
struct ProfileActionsView: View {
    // This allows the parent view to tell this button what to do.
    var onRegisterTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            // This button's action now calls the onRegisterTapped function.
            Button(action: onRegisterTapped) {
                VStack(spacing: 8) {
                    Image(systemName: "briefcase.fill")
                        .font(.title)
                    Text("Become a Professional")
                        .font(.caption)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, minHeight: 100)
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .foregroundStyle(.primary)

            actionButton(iconName: "building.2.fill", text: "Business Collaboration")
        }
        .padding(.horizontal)
    }

    private func actionButton(iconName: String, text: String) -> some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.title)
                Text(text)
                    .font(.caption)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, minHeight: 100)
            .padding(8)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .foregroundStyle(.primary)
    }
}

// This view shows analytics for a professional user.
struct EarningsAndAnalyticsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Dashboard")
                .font(.title2)
                .fontWeight(.bold)

            HStack {
                VStack(alignment: .leading) {
                    Text("Earnings (30 Days)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text("$4,850")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
