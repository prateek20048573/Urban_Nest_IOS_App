import SwiftUI

struct TopNavBar: View {
    var body: some View {
        HStack(spacing: 24) {
            navButton(iconName: "house.lodge", text: "Real Estate")
            
            // This is now a link to our new screen.
            NavigationLink {
                ProfessionalsView()
            } label: {
                navButton(iconName: "person.badge.shield.checkmark", text: "Professionals")
            }
            
            navButton(iconName: "wrench.and.screwdriver", text: "Services")
        }
        .frame(maxWidth: .infinity)
    }
    
    private func navButton(iconName: String, text: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: iconName)
                .font(.title2)
                .frame(width: 60, height: 60)
                .background(Color(.systemGray6))
                .clipShape(Circle())
            Text(text)
                .font(.caption)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.primary)
    }
}
