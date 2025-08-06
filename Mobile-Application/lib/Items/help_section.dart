import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSection extends StatefulWidget {
  const HelpSection({super.key});

  @override
  _HelpSectionState createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> {
  // Track the index of the selected item
  int? selectedIndex;
  bool isPressed = false; // Track if an item is being pressed

  @override
  Widget build(BuildContext context) {
    List<String> helpContents = [
      "Help Center",
      "Contact Us",
      "Shipping Info",
      "Track My Order",
      "Return & Exchanges",
    ];

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
              // Help Heading
              Text(
                'Help',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16), // Space between heading and content

              // List of help contents
              for (int i = 0; i < helpContents.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = i; // Set the selected item
                      });
                    },
                    onTapDown: (_) {
                      setState(() {
                        isPressed = true; // Item is being pressed
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        isPressed = false; // Finger released
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        isPressed = false; // Finger canceled the tap
                      });
                    },
                    child: Text(
                      helpContents[i],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isPressed
                            ? Colors.black // Black when pressed
                            : (selectedIndex == i
                            ? Colors.black // Selected item stays black
                            : Colors.black54), // Non-selected items are slightly lighter
                        decoration: isPressed
                            ? TextDecoration.underline // Underline when pressed
                            : (selectedIndex == i
                            ? TextDecoration.underline // Underlined if selected
                            : TextDecoration.none), // No underline when not pressed or selected
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}