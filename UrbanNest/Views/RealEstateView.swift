import SwiftUI

struct RealEstateView: View {
    // This creates the ViewModel to handle fetching data.
    @StateObject private var viewModel = RealEstateViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    TopNavBar()

                    // Show a loading indicator while fetching from the cloud.
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    } else {
                        // Display the properties that were fetched from the ViewModel.
                        propertyList(title: "Available Properties", properties: viewModel.properties)
                    }
                }
                .padding(.vertical)
            }
            .searchable(text: $searchText, prompt: "Search Real Estate, Professionals, Services")
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            // Fetch the properties from CloudKit when the view appears.
            .onAppear {
                Task {
                    await viewModel.fetchProperties()
                }
            }
        }
    }
    
    private func propertyList(title: String, properties: [Property]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.title2).fontWeight(.bold).padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(properties) { property in
                        PropertyCardView(property: property)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

//import SwiftUI
//
//struct RealEstateView: View {
//    @StateObject private var viewModel = RealEstateViewModel()
//    @State private var searchText = ""
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 32) {
//                    TopNavBar()
//
//                    if viewModel.isLoading {
//                        ProgressView()
//                            .frame(maxWidth: .infinity)
//                    } else {
//                        // This displays the property listings in sliding containers
//                        propertyList(title: "Available Properties", properties: viewModel.properties)
//                    }
//                }
//                .padding(.vertical)
//            }
//            .searchable(text: $searchText, prompt: "Search Real Estate, Professionals, Services")
//            .navigationTitle("Explore")
//            .navigationBarTitleDisplayMode(.inline)
//            .onAppear {
//                Task {
//                    await viewModel.fetchProperties()
//                }
//            }
//        }
//    }
//
//    private func propertyList(title: String, properties: [Property]) -> some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text(title).font(.title2).fontWeight(.bold).padding(.horizontal)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 16) {
//                    ForEach(properties) { property in
//                        PropertyCardView(property: property)
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}
