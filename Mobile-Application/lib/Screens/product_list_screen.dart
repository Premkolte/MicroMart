import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Screens/product_detail_screen.dart';
import '../Dataset/box_data.dart'; // Assuming BoxData is defined in box_data.dart // Import the product detail screen

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<BoxData> filteredProducts = boxDataset;
  String searchQuery = '';

  void filterProducts(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = boxDataset
          .where((product) =>
          product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5),
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.black54, // Set the app bar color to black54
        titleTextStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 20), // Set title text to white
        iconTheme: IconThemeData(
          color: Colors.white, // Set icons to white
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterProducts,
              style: GoogleFonts.poppins(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a product...',
                hintStyle: GoogleFonts.poppins(color: Colors.white), // Set hint text to white
                prefixIcon: Icon(Icons.search, color: Colors.white), // Set search icon to white
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.white), // Set border to white
                ),
                filled: true,
                fillColor: Colors.black54, // Set background of the input field to black54
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(
              product.productName,
              overflow: TextOverflow.ellipsis, // Truncate if text is too long
              maxLines: 1, // Show product name in one line
              style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500), // Set product name text to black
            ),
            subtitle: Text(
              '₹${product.price}',
              style: GoogleFonts.poppins(color: Colors.black), // Set price text to black
            ),
            onTap: () {
              // Navigate to the ProductDetailScreen and pass the selected product
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    imagePath: product.imagePath, // Pass the imagePath
                    productName: product.productName, // Pass the productName
                    price: product.price, // Pass the price
                    category: product.category, // Pass the category
                    description: product.description, // Pass the productDescription
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}