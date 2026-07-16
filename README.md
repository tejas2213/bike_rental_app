# Bike & Scooter Rental Marketplace

A complete Flutter application for a Bike & Scooter Rental Marketplace, built as an internship task.

## Features

*   **Authentication**: Mobile number login and OTP verification (Dummy flow).
*   **Home Screen**: Fetching data from a FakeStore API and presenting it elegantly with Riverpod.
*   **Search & Sorting**: Filter bikes by name and sort by price (Asc/Desc) or Rating.
*   **Bike Details**: Detailed view of each bike with price, ratings, description, and Map location.
*   **Booking Flow**: Select pickup and return dates with a total price calculator.
*   **Smooth Animations**: Using `flutter_animate` for beautiful transitions and interactions.
*   **State Management**: `flutter_riverpod` (v3+ architecture using `NotifierProvider`).
*   **Routing**: `go_router` for seamless and declarative navigation.
*   **Theme**: Light and Dark mode support out-of-the-box.
*   **Image Caching**: Optimized images using `cached_network_image`.
*   **Map Integration**: Placeholder map using `google_maps_flutter`.

## Packages Used

*   `flutter_riverpod` - State management
*   `go_router` - Routing and deep linking
*   `dio` - Network requests (FakeStore API)
*   `shared_preferences` - Local storage for authentication state
*   `cached_network_image` - Image caching
*   `google_maps_flutter` - Map display
*   `flutter_animate` - Micro-animations and page transitions
*   `intl` - Date formatting
*   `google_fonts` - Typography

## Folder Structure

```
lib/
├── core/
│   ├── app_colors.dart
│   ├── app_router.dart
│   └── app_theme.dart
├── models/
│   └── bike_model.dart
├── screens/
│   ├── bike_details_screen.dart
│   ├── booking_screen.dart
│   ├── booking_success_screen.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   └── otp_screen.dart
├── services/
│   ├── api_service.dart
│   └── auth_service.dart
├── state_management/
│   ├── auth_provider.dart
│   ├── bike_list_provider.dart
│   └── bike_provider.dart
├── widgets/
│   └── bike_card.dart
└── main.dart
```

## Project Setup

1.  **Clone the repository**
2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```
3.  **Run the app**
    ```bash
    flutter run
    ```
    *Note: To fully utilize Google Maps, ensure you provide a valid Google Maps API Key in `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift`. A placeholder layout is used for demonstration.*

## Screenshots

*(Screenshots to be added here)*
