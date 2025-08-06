import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Items/rounded_box.dart'; // Import the CustomSliverAppBar
import '../Dataset/box_data.dart';
import '../Items/appbar.dart'; // Import your dataset

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust font size and padding based on screen size
    final double categoryFontSize = screenWidth * 0.08; // 8% of screen width
    final double gridPadding = screenWidth * 0.04; // 4% of screen width
    final double gridSpacing = screenWidth * 0.03; // 3% of screen width
    final int crossAxisCount = (screenWidth > 600) ? 3 : 2; // Use 3 columns on larger screens

    // Filter the dataset based on the category
    List<Widget> categoryItems = boxDataset
        .where((box) => box.category == category) // Filter by category
        .map((box) => Padding(
      padding: const EdgeInsets.only(bottom: 4), // Add spacing
      child: RoundedBox(
        imagePath: box.imagePath,
        productName: box.productName,
        price: box.price,
        category: box.category,
        description: box.description,
      ),
    ))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: "Micro Mart",
            expandedHeight: 50.0,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: gridPadding, // Adjust padding dynamically
                horizontal: gridPadding,
              ),
              child: Text(
                category, // Display the category name
                style: GoogleFonts.poppins(
                  fontSize: categoryFontSize, // Responsive font size
                  fontWeight: FontWeight.w900, // Make it bold
                  color: const Color(0xFFFF5A1E), // Set a color for the title
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(gridPadding), // Adjust grid padding dynamically
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // Dynamically determine columns
                crossAxisSpacing: gridSpacing, // Horizontal space between items
                mainAxisSpacing: gridSpacing, // Vertical space between items
                childAspectRatio: 0.7, // Maintain consistent aspect ratio
              ),
              delegate: SliverChildListDelegate(categoryItems),
            ),
          ),
        ],
      ),
    );
  }
}