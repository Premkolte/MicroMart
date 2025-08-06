import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Items/rounded_box.dart'; // Import RoundedBox
import '../Dataset/box_data.dart';
import '../Items/appbar.dart'; // Import CustomSliverAppBar

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    // Create a copy of the dataset and shuffle it
    List shuffledDataset = List.of(boxDataset)..shuffle();

    // Map the shuffled dataset to display all products
    List<Widget> allProducts = shuffledDataset
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

    // Dynamic adjustments based on screen size
    final double titleFontSize = screenWidth * 0.08; // 8% of screen width
    final double gridPadding = screenWidth * 0.04; // 4% of screen width
    final double gridSpacing = screenWidth * 0.03; // 3% of screen width
    final int crossAxisCount = (screenWidth > 600) ? 3 : 2; // Use 3 columns for larger screens

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
                "All Products", // Display the screen title
                style: GoogleFonts.poppins(
                  fontSize: titleFontSize, // Responsive font size
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
              delegate: SliverChildListDelegate(allProducts),
            ),
          ),
        ],
      ),
    );
  }
}