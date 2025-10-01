# UrbanNest - iOS Developer Technical Evaluation

This project is a fully functional iOS application built as part of the technical evaluation for the iOS App Developer role at SY Group.

## Overview

UrbanNest is a real estate and professional services platform inspired by the Airbnb UI. It allows users to browse property listings, list their own properties with images, register as professionals, and view a list of all registered professionals.

## Features Implemented

- [x] **Property Browsing:** Main screen displays property listings fetched from CloudKit.
- [x] **Property Listing:** A complete form that allows users to add a new property with an image, saving it directly to CloudKit.
- [x] **Professional Registration:** A form for users to register as a professional, saving the data to CloudKit.
- [x] **Professional Listing:** A screen that fetches and displays a list of all registered professionals.
- [x] **Dynamic Profile:** A user profile screen that shows different information based on user type (regular vs. professional).
- [x] **Wishlist:** Users can "like" properties on the main screen and view them in a dedicated Wishlist tab.
- [x] **Polished UI:** A complete, professional UI for all main screens, including a static Messages screen.

## Architecture

This project is built using **SwiftUI** and follows the **MVVM (Model-View-ViewModel)** architecture.

- **Models:** Define the data structures (`Property`, `Professional`).
- **Views:** Define the UI and layout.
- **ViewModels:** Contain the business logic, fetching data, and preparing it for the Views.
- **Managers:** Centralized services like `CloudKitManager` handle interactions with the backend.

## Development Strategy & Problem-Solving

A key part of this evaluation was to handle ambiguity and solve problems under constraints. During development, I encountered a persistent CloudKit permissions issue (`CREATE operation not permitted`) with the provided team account.

To demonstrate resourcefulness and ensure the completion of a fully functional app, I implemented the following solutions:

1. **Schema First:** I manually configured the CloudKit Console by creating the `Record Types`, `Fields`, `Indexes`, and `Security Roles` required by the application.
2. **Permissions Troubleshooting:** I systematically debugged the Security Roles, creating a custom `PublicUser` role to grant the necessary `Create` and `Read` permissions when the default roles were unresponsive.
3. **(Optional: If you used your Personal Team)** *If you ended up using your Personal Team, add this sentence:* "Ultimately, to guarantee a functional product for submission, I switched to my own developer account which gave me the necessary administrative control to finalize the backend."

This approach allowed me to bypass the external blocker and deliver a complete, full-stack application that meets all the assignment's core requirements.

## How to Run

1. Clone the repository.
2. Open the `.xcodeproj` file in Xcode.
3. Select a simulator (e.g., iPhone 17 Pro).
4. Run the app (Cmd + R).
