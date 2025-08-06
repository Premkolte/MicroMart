import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/all_products_screen.dart';
import '../Screens/category_screen.dart'; // Import AllProductsScreen

class Capsule extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;

  const Capsule({
    Key? key,
    required this.text,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the correct screen based on the text in the capsule
        if (text == "All") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllProductsScreen(), // Navigate to AllProductsScreen
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(category: text), // Navigate to CategoryScreen with the category
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), // Adjust padding
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 12, // Slightly smaller font for better fit
          ),
        ),
      ),
    );
  }
}