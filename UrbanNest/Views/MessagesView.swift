import SwiftUI

// A simple model for a message thread
struct MessageThread: Identifiable {
    let id = UUID()
    let personName: String
    let lastMessage: String
    let timestamp: String
    let isSupport: Bool
}

struct MessagesView: View {
    // Sample data for the UI
    let threads: [MessageThread] = [
        .init(personName: "Airbnb Support", lastMessage: "Open to see the latest messages", timestamp: "Yesterday", isSupport: true),
        .init(personName: "John Appleseed", lastMessage: "Great! See you then.", timestamp: "2d ago", isSupport: false),
        .init(personName: "Jane Doe", lastMessage: "Is the property still available?", timestamp: "5d ago", isSupport: false)
    ]

    var body: some View {
        NavigationView {
            // Provides chat and messaging functionality for users and professionals.
            List(threads) { thread in
                HStack(spacing: 12) {
                    // This line is now corrected to use the system image name directly.
                    Image(systemName: thread.isSupport ? "a.circle.fill" : "person.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(thread.isSupport ? .primary : .secondary)
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(thread.personName)
                                .font(.headline)
                            Spacer()
                            Text(thread.timestamp)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Text(thread.lastMessage)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }
                .padding(.vertical, 4)
            }
            .listStyle(.plain)
            .navigationTitle("Messages")
        }
    }
}
