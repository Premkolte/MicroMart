import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedRectangle extends StatelessWidget {
  final String imagePath; // Path of the image to display
  final String labelText; // Text to display at the bottom-left
  final double height; // Height of the rectangle
  final double borderRadius; // Border radius for rounded corners

  const RoundedRectangle({
    Key? key,
    required this.imagePath,
    required this.labelText,
    this.height = 150.0,
    this.borderRadius = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          // Background image
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[200], // Background color while image loads
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensures the image fills the box without distortion
              width: double.infinity,
            ),
          ),
          // Bottom overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text on the bottom-left
                  Text(
                    labelText,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Circle with rotated arrow on the bottom-right
                  Container(
                    height: 36.0,
                    width: 36.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF5A1E),
                      shape: BoxShape.circle,
                    ),
                    child: Transform.rotate(
                      angle: 45 * 3.141592653589793*(-1) / 180, // Convert 60 degrees to radians
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}