import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart'; // Import HomeScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Text animation
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration for text
      vsync: this,
    );

    // Initialize the text animation with an empty range
    _textAnimation = IntTween(begin: 0, end: "Micro Mart.".length).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Delay the start of the animation by 1 second
    Future.delayed(const Duration(seconds: 1), () {
      // Start the typewriter animation after 1 second
      _controller.forward();
    });

    // Listen for the completion of the animation and trigger navigation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After animation completes, navigate to the HomeScreen
        if (mounted) {
          Navigator.pushReplacement(
            context,
            _createLeftToRightPageRoute(), // Custom left-to-right transition
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Custom transition to navigate from the SplashScreen to HomeScreen
  PageRouteBuilder _createLeftToRightPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slow down the transition by increasing the duration of the transition animation
        const begin = Offset(1.0, 0.0); // Start from the right side for Home Screen
        const end = Offset.zero; // End at the center for Home Screen
        const curve = Curves.easeInOut; // Smooth curve for the transition

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // Define the animation for the splash screen (it will slide out to the left)
        var splashTween = Tween(begin: Offset.zero, end: Offset(-1.0, 0.0)).chain(CurveTween(curve: curve));
        var splashOffsetAnimation = animation.drive(splashTween);

        // Slow down the transition by extending the duration of the transition
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 1), // Adjust the transition duration here (1 second for a slower transition)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5A1E), // Splash screen background color
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Only show the text when the animation value reaches a certain point
            String displayedText = "Micro Mart.".substring(0, _textAnimation.value);

            return Text(
              displayedText,
              style: GoogleFonts.poppins(
                fontSize: 48, // Text size
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}