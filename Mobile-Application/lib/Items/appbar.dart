import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:msme_exhibition/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/logged_in_page.dart';
import '../Screens/product_list_screen.dart';
import 'cart_modal.dart';
import 'cart_provider.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final double expandedHeight;
  final String? backgroundImage;
  final String? subtitle;

  const CustomSliverAppBar({
    Key? key,
    required this.title,
    this.expandedHeight = 200.0,
    this.backgroundImage,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoginScreen = ModalRoute.of(context)?.settings.name == '/login';

    // Access the cart item count from CartProvider
    final cartItemCount = Provider.of<CartProvider>(context).items.length;

    return SliverAppBar(
      backgroundColor: Colors.black54,
      pinned: true,
      expandedHeight: expandedHeight,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: backgroundImage != null
            ? Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              backgroundImage!,
              fit: BoxFit.cover,
            ),
            if (subtitle != null)
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Text(
                  subtitle!,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        )
            : null,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductListScreen(), // Redirect to the product list screen
                    ),
                  );
                },
                icon: const Icon(Icons.search, color: Colors.white),
              ),
              // Cart icon with badge
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      _showCartModal(context);
                    },
                    icon: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
                  ),
                  if (cartItemCount > 0) // Show badge only if there are items
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$cartItemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () async {
                      bool isLoggedIn = await _checkLoginStatus();
                      if (isLoggedIn) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoggedInPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // Check if user is logged in
  }

  // Function to show the modal bottom sheet when the cart is clicked
  void _showCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CartModal();
      },
    );
  }
}