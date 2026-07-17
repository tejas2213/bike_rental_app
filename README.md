# Bike & Scooter Rental Marketplace

A complete Flutter application for a Bike & Scooter Rental Marketplace, built as an internship task.

## Features

*   **Authentication**: Mobile number login and OTP verification (Dummy flow).
*   **Home Screen**: Fetching data from a FakeStore API and presenting it elegantly wit<img width="285" height="625" alt="Screenshot 2026-07-17 110917" src="https://github.com/user-attachments/assets/abf9fc25-f429-4807-83d5-9428065f43c8" />
<img width="292" height="630" alt="Screenshot 2026-07-17 110849" src="https://github.com/user-attachments/assets/b2abd164-d80f-429e-b92b-acd8e9fab498" />
<img width="290" height="621" alt="Screenshot 2026-07-17 110835" src="https://github.com/user-attachments/assets/545759da-a225-4d53-a09b-73f92c706552" />
<img width="292" height="623" alt="Screenshot 2026-07-17 110827" src="https://github.com/user-attachments/assets/ae69c428-04f3-4259-bc8b-e194b5bc457c" />
<img width="287" height="628" alt="Screenshot 2026-07-17 110809" src="https://github.com/user-attachments/assets/80726c82-5f51-45c3-b578-b6b7932a3c65" />
<img width="287" height="630" alt="Screenshot 2026-07-17 110755" src="https://github.com/user-attachments/assets/fdd86345-f982-4c85-b8b7-6cb9fbadfdbb" />
<img width="285" height="626" alt="Screenshot 2026-07-17 110745" src="https://github.com/user-attachments/assets/49dc5f57-60d6-404e-8435-76624685148a" />
<img width="300" height="627" alt="Screenshot 2026-07-17 110733" src="https://github.com/user-attachments/assets/1f39a974-4897-4f96-b0a0-527a35ae4301" />
<img width="295" height="632" alt="Screenshot 2026-07-17 110720" src="https://github.com/user-attachments/assets/17025e92-ecfd-43c2-8b18-7593b069dc72" />
<img width="290" height="637" alt="Screenshot 2026-07-17 110707" src="https://github.com/user-attachments/assets/1cb52e7c-04c7-4de9-ac4b-71e7fba9ddc0" />
<img width="295" height="627" alt="Screenshot 2026-07-17 110629" src="https://github.com/user-attachments/assets/72e82290-ecf6-4456-85ba-99cf6769f8da" />
<img width="285" height="625" alt="Screenshot 2026-07-17 110917" src="https://github.com/user-attachments/assets/7d371b94-1679-4d75-a712-3558e707290f" />
h Riverpod.
*   **Search & Sorting**: Filter bikes by name and sort by price (Asc/Desc) or Rating.
*   **Bike Details**: Detailed view of each bike with price, ratings, description, and Map location.
*   **Booking Flow**: Select pickup and return dates with a total price calculator.
*   **Smooth Animations**: Using `flutter_animate` for beautiful transitions and interactions.
*   **State Management**: `flutter_riverpod` (v3+ architecture using `NotifierProvider`).
*   **Routing**: `go_router` for seamless and declarative navigation.
*   **Theme**: Light and Dark mode support out-of-the-box.
*   **Image Caching**: Optimized images using `cached_network_image`.
*   **Map Integration**: Real map integration using `google_maps_flutter`.

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
    *Note: To fully utilize Google Maps, ensure you provide a valid Google Maps API Key in `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift`.*

## Screenshots

*(Screenshots to be added here)*
