# soulee_project

# Flutter Profile Page with Firebase Integration

This project implements a Flutter profile page that matches the provided Figma design and integrates with Firebase for backend data.

## Features

- UI implementation matching the Figma design
- Firebase Authentication integration
- Firestore for storing user profile data
- GetX state management
- Responsive layout for mobile screens
- Profile editing functionality
- Loading states and error handling

## Apk Link
- https://drive.google.com/file/d/1T6lTZ32O9kkpI_8zufIyvTB1wS7IKQeI/view?usp=drive_link

## Screenshots

![solueeeee](https://github.com/user-attachments/assets/e43b7a6e-9ec3-414a-8ee0-d0fe6d148ce9)
![solueeee2](https://github.com/user-attachments/assets/8404dc39-3ddf-42c1-af2f-59dfbdd31202)

![sssssss](https://github.com/user-attachments/assets/70687051-335c-4f07-af03-15bc101ec789)

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Firebase account
- Android Studio / VS Code

### Firebase Setup

1. Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication in Firebase Console
    - Enable Anonymous Authentication for demo purposes
5. Create Firestore Database
    - Start in test mode
6. Enable Storage
    - Start in test mode

### Configuration

1. Update the `firebase_options.dart` file with your Firebase configuration

## Project Structure

- `lib/main.dart` - Entry point of the application
- `lib/controllers/` - GetX controllers for state management
- `lib/models/` - Data models
- `lib/screens/` - UI screens
- `lib/widgets/` - Reusable UI components
- `lib/firebase_options.dart` - Firebase configuration

## Dependencies

- `firebase_core` - Firebase core functionality
- `firebase_auth` - Firebase authentication
- `cloud_firestore` - Firestore database
- `firebase_storage` - Firebase storage for images
- `get` - GetX state management
- `cached_network_image` - Image caching
- `image_picker` - For selecting images from gallery

## Firestore Structure

\`\`\`
/users/{uid}
- uid: string
- name: string
- username: string
- bio: string
- profilePicture: string (URL)
- followers: number
- following: number
- posts: number
- createdAt: timestamp
  \`\`\`

## License

This project is licensed under the MIT License - see the LICENSE file for details.


## Clone this repository:

git clone https://github.com/zihadsikder/soulee_project
cd soulee_project

## Install dependencies

Run the following commands to install the required packages:

\`\`\`bash
flutter pub get
\`\`\`

### Running the App

\`\`\`bash
flutter run
\`\`\`


