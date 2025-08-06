import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Transparent background
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(
            color: Colors.black, // Black border
            width: 2, // Border width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the box
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Footer Heading
              Text(
                'Micro Mart',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20), // Space between the title and description
              // Footer Description
              Text(
                'Unleash your fashion. Find your flow',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Divider(
                color: Colors.black, // Divider color
                thickness: 1, // Divider thickness
              ),
              const SizedBox(height: 18), // Space between divider and social icons
              // Social Media Icons (Aligned with the divider)
              Row(
                children: [
                  // Instagram Icon (with SVG)
                  Expanded(
                    child: SvgPicture.asset(
                      'images/icons/instagram.svg', // Add your Instagram SVG logo here
                      height: 24, // Set a fixed height for the icon// Icon color
                    ),
                  ),
                  // Twitter Icon (with SVG)
                  Expanded(
                    child: SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/5/53/X_logo_2023_original.svg', // Add your Twitter SVG logo here
                      height: 24, // Set a fixed height for the icon// Icon color
                    ),
                  ),
                  // Facebook Icon (with SVG)
                  Expanded(
                    child: SvgPicture.asset(
                      'images/icons/facebook.svg', // Add your Facebook SVG logo here
                      height: 24, // Set a fixed height for the icon// Icon color
                    ),
                  ),
                  // YouTube Icon (with SVG)
                  Expanded(
                    child: SvgPicture.asset(
                      'images/icons/youtube.svg', // Add your YouTube SVG logo here
                      height: 24, // Set a fixed height for the icon// Icon color
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Text(
                'All rights reserved. © 2024 Micro Mart',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}