import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'Items/cart_provider.dart'; // Import the cart provider
import 'Screens/splash_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/logged_in_page.dart'; // Add the logged-in screen
import 'Screens/home_screen.dart'; // Assuming you have a home screen

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()..loadCart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginScreen(),
        '/logged-in': (context) => const LoggedInPage(),
        '/home': (context) => const HomeScreen(), // Add route to HomeScreen
      },
      title: 'Micro Mart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // SplashScreenWrapper to handle splash screen and then go to Home
      debugShowCheckedModeBanner: false,
    );
  }
}