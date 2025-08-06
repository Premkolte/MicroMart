import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Screens/product_detail_screen.dart'; // Import the ProductDetailScreen
import 'cart_provider.dart'; // Import the CartProvider
import 'cart_model.dart'; // Import the CartItem model

/// A custom widget to display a product in a rounded box design.
/// Tapping the box navigates to the ProductDetailScreen.
class RoundedBox extends StatelessWidget {
  final String imagePath; // Path to the product image
  final String productName; // Name of the product
  final String price; // Price of the product
  final String category; // Category to which the product belongs
  final String? description; // Optional detailed description of the product

  const RoundedBox({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.category,
    this.description, // Optional description parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Get the CartProvider

    return GestureDetector(
      onTap: () {
        // Navigate to the ProductDetailScreen and pass the product details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imagePath: imagePath,
              productName: productName,
              price: price,
              category: category,
              description: description, // Pass the description
            ),
          ),
        );
        print("Description passed: $description");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image Box
          Container(
            width: 165,
            height: 165, // Fixed size for the box
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: 100, // Fixed width for the image
                height: 100, // Fixed height for the image
                fit: BoxFit.contain, // Ensures the image does not stretch
              ),
            ),
          ),

          const SizedBox(height: 10), // Spacing between image and text

          // Product Name and Add to Cart Icon Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Name
                Expanded(
                  child: Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Handles long product names
                  ),
                ),

                // Add to Cart Icon
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  color: const Color(0xFFFF5A1E), // Accent color for the cart icon
                  onPressed: () {
                    // Create a new CartItem and add it to the cart
                    CartItem newItem = CartItem(
                      productName: productName,
                      price: price,
                      imagePath: imagePath,
                      category: category,
                    );
                    cartProvider.addToCart(newItem); // Add to cart action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item added to cart!')),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 5), // Space between name+icon row and price

          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align price to the left
              children: [
                Text(
                  '₹$price', // Display price with currency symbol
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}