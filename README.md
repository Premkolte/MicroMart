# MicroMart - Complete E-commerce Solution

A comprehensive e-commerce platform featuring both a modern web application and a mobile Flutter app, providing seamless shopping experiences across all devices.

## 🌐 Live Demo
- **Website**: [https://micro-mart-nk302zcbt-premkoltes-projects.vercel.app](https://micro-mart-nk302zcbt-premkoltes-projects.vercel.app)

## 📱 Project Overview

MicroMart is a full-stack e-commerce solution that includes:
- **Web Application** (MERN-Website): A responsive React-based e-commerce website
- **Mobile Application** (Android-App): A Flutter-based mobile application

## 🚀 Tech Stack

### Web Application (MERN-Website)
- **Frontend**: React 18, TypeScript
- **State Management**: Redux Toolkit, Redux Thunk
- **Routing**: React Router v6
- **Styling**: SCSS, Framer Motion
- **HTTP Client**: Axios
- **UI Components**: SwiperJS for carousels
- **Build Tool**: Vite
- **Deployment**: Vercel

### Mobile Application (Android-App)
- **Framework**: Flutter
- **Language**: Dart
- **Platform**: Android (with iOS support)

## ✨ Features

### Web Application
- 🎨 Fully responsive design
- 🛒 Add to cart functionality
- 🗑️ Remove items from cart
- 💳 Checkout process
- 🖼️ Lazy loading of images
- ⚡ Image optimization
- 🔍 Quick view for products
- 📄 Detailed product pages
- 🛍️ Shopping cart management
- 🔐 User authentication/login
- 📱 Mobile-first responsive design
- 🎭 Smooth animations with Framer Motion

### Mobile Application
- 📱 Native mobile experience
- 🛒 Shopping cart functionality
- 📦 Product browsing
- 👤 User authentication
- 🎨 Modern UI/UX design

## 📁 Project Structure

```
MicroMart/
├── MERN-Website/           # React Web Application
│   ├── src/
│   │   ├── app/           # Redux store configuration
│   │   ├── components/    # Reusable React components
│   │   ├── features/      # Feature-based modules
│   │   ├── pages/         # Page components
│   │   ├── routes/        # Routing configuration
│   │   └── types/         # TypeScript type definitions
│   ├── public/            # Static assets
│   ├── package.json
│   └── vite.config.ts
├── Android-App/           # Flutter Mobile Application
│   ├── lib/
│   │   ├── main.dart      # Main application entry
│   │   ├── Dataset/       # Data models
│   │   ├── Items/         # UI components
│   │   └── Screens/       # App screens
│   ├── android/           # Android-specific files
│   ├── ios/              # iOS-specific files
│   ├── images/           # Image assets
│   └── pubspec.yaml
└── vercel.json           # Deployment configuration
```

## 🛠️ Installation & Setup

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn
- Flutter SDK (for mobile app)
- Android Studio / VS Code

### Web Application Setup

1. **Clone the repository**
```bash
git clone https://github.com/Premkolte/MicroMart.git
cd MicroMart
```

2. **Navigate to web application directory**
```bash
cd MERN-Website
```

3. **Install dependencies**
```bash
npm install
```

4. **Start development server**
```bash
npm run dev
```

5. **Build for production**
```bash
npm run build
```

### Mobile Application Setup

1. **Navigate to Flutter app directory**
```bash
cd Android-App
```

2. **Install Flutter dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

4. **Build APK**
```bash
flutter build apk
```

## 📱 Screenshots

### Web Application

#### Landing Page
![Landing Page](https://github.com/athulrajhere/FlowyCart-ecommerce-react-redux/assets/47721687/08bfe128-7342-4c40-8068-f6e925391932)

#### Collections
![Collections](https://github.com/athulrajhere/FlowyCart-ecommerce-react-redux/assets/47721687/698c079d-a4ee-463d-ace3-5f0236eb7795)

#### Product Details
![Product Details](https://github.com/athulrajhere/FlowyCart-ecommerce-react-redux/assets/47721687/b2151f0a-5037-4355-909f-87ba054a0085)

#### Cart Modal
![Cart Modal](https://github.com/athulrajhere/FlowyCart-ecommerce-react-redux/assets/47721687/536a196e-928d-47c4-b212-02081be8b5be)

#### Shopping Bag
![Shopping Bag](https://github.com/athulrajhere/FlowyCart-ecommerce-react-redux/assets/47721687/112643db-83fe-4d73-96a2-0f0a29f363ad)

## 🚀 Deployment

### Web Application (Vercel)
The web application is automatically deployed to Vercel when changes are pushed to the main branch.

**Deployment URL**: [https://micro-mart-nk302zcbt-premkoltes-projects.vercel.app](https://micro-mart-nk302zcbt-premkoltes-projects.vercel.app)

### Mobile Application
The Flutter app can be built and distributed through:
- Google Play Store (Android)
- Apple App Store (iOS)
- Direct APK distribution

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Available Scripts

### Web Application
- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint

### Mobile Application
- `flutter run` - Run the app
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter test` - Run tests

## 🐛 Issues & Support

If you encounter any issues or have questions, please create an issue in this repository.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Prem Kolte**
- GitHub: [@Premkolte](https://github.com/Premkolte)

---

⭐ If you found this project helpful, please give it a star!
