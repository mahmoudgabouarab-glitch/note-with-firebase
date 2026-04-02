# 📝 Note App

A full-featured **notes management** Flutter application powered by **Firebase**, built with **BLoC**, supporting **push notifications** for note reminders and **multi-language** support.

---

## ✨ Features

- 🔐 Email/Password & Google Sign-In (Firebase Auth)
- 📝 Create, edit, and delete notes stored on **Cloud Firestore**
- 📲 Push Notifications for note reminders (FCM)
- 🔔 Local Notifications with timezone-aware scheduling
- 🌍 Multi-language support — Arabic & English (Easy Localization)
- 🌓 Adaptive dialogs for confirm/delete actions
- 💾 Local preferences persistence
- 📱 Fully responsive UI with ScreenUtil
- 🎨 Custom font — **Inder**

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| State Management | `flutter_bloc ^9.1.1` |
| Auth | `firebase_auth ^6.1.2` + `google_sign_in ^6.2.1` |
| Database | `cloud_firestore ^6.1.0` |
| Push Notifications | `firebase_messaging ^16.0.4` |
| Local Notifications | `flutter_local_notifications ^20.1.0` |
| Localization | `easy_localization ^3.0.8` |
| Preferences | `shared_preferences ^2.5.4` |
| UI Scaling | `flutter_screenutil ^5.9.3` |
| Dialogs | `adaptive_dialog ^2.6.0` |
| Date Formatting | `intl ^0.20.2` |
| Models | `equatable ^2.0.8` |

---

## 🏗️ Architecture

This project follows **Clean Architecture** with **BLoC** as the state management pattern:

```
lib/
├── core/
│   ├── network/
│   │   ├── bloc_observer.dart
│   │   ├── cache_helper.dart
│   │   ├── constant_collection_fb.dart
│   │   ├── fire_base_helper.dart
│   │   └── local_notification_service.dart
│   │
│   └── utils/
│       ├── app_assets.dart
│       ├── app_color.dart
│       ├── app_styles.dart
│       ├── extension.dart
│       ├── function.dart
│       └── speacing.dart
│
├── widgets/                      # Shared reusable widgets
│   ├── custom_button.dart
│   ├── custom_list_of_note.dart
│   ├── custom_loading.dart
│   ├── custom_show_bottom_sheet.dart
│   ├── custom_snakbar.dart
│   └── custom_text_filed.dart
│
├── features/
│   ├── auth/
│   │   ├── model/
│   │   ├── view/
│   │   └── view_model/
│   │
│   ├── home/
│   │   ├── data/
│   │   └── presentation/
│   │
│   └── splash/
│       └── splash.dart
│
├── generated/
│   └── firebase_options.dart
├── main.dart
└── myapp.dart
```

---

## 📸 Screenshots

# OnBording

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/6ef45368-c163-4c84-9043-a844eb228e73" />

# Auth

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/1dc3cb32-91c1-43b3-9312-43ea8d02b5ce" />

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/c1c27c2f-77bc-4a81-ac9d-c0928b4fd287" />

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/70f49a31-9338-4a4b-9fa4-5df9a36106d2" />

# Home 

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/ce206f52-7580-493c-ad81-edf82fa2f1f8" />

# Settings 

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/b1e87904-f2fd-44cc-a4b1-4a4454372559" />

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/b6c7a64a-daf9-43f2-9790-36ce00f7c793" />

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/13049bbb-eeed-4e28-9116-47a3e716415e" />

# Notification

<img width="1280" height="2856" alt="Image" src="https://github.com/user-attachments/assets/5cace780-54ad-4b9b-819d-2a4707df5859" />