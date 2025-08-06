import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Items/appbar.dart';
import '../Items/cart_model.dart';
import '../Items/cart_provider.dart';
import '../Items/footer_section.dart';
import '../Items/help_section.dart';

class ProductDetailScreen extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String price;
  final String category;
  final String? description;

  const ProductDetailScreen({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.category,
    this.description,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late int discount;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _generateDiscount();
    _startDiscountUpdater();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _generateDiscount() {
    setState(() {
      discount = Random().nextInt(21) + 10; // Generate discount between 10% and 30%
    });
  }

  void _startDiscountUpdater() {
    _timer = Timer.periodic(const Duration(hours: 1), (timer) {
      _generateDiscount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double discountedPrice = double.parse(widget.price.replaceAll(',', ''));
    final double originalPrice = discountedPrice / (1 - (discount / 100));

    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5),
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: "Micro Mart",
            expandedHeight: 50,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),

                      // Main Image
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Show zoomable image dialog
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: InteractiveViewer(
                                  clipBehavior: Clip.none,
                                  panEnabled: true,
                                  scaleEnabled: true,
                                  minScale: 0.5,
                                  maxScale: 5.0,
                                  child: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        widget.imagePath,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                widget.imagePath,
                                width: 350,
                                height: 550,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Product Details
                      Text(
                        widget.productName,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color(0xFFFF5A1E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      if (widget.description != null && widget.description!.isNotEmpty)
                        ExpansionTile(
                          title: Text(
                            'Product Description',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.description!,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 10),

                      // Price Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Generate Random Discount
                              Text(
                                '-${Random().nextInt(21) + 10}%', // Random discount between 10% and 30%
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFF5A1E),
                                ),
                              ),
                              const SizedBox(width: 8), // Add spacing between discount and price

                              // Discounted Price
                              Text(
                                '₹$discountedPrice', // The discounted price
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900, // Bold the price number
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5), // Space between price and original M.R.P.

                          // Original M.R.P.
                          Row(
                            children: [
                              // "M.R.P." Label
                              Text(
                                'M.R.P.: ',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.grey, // Use grey color for the label
                                ),
                              ),

                              // Original Price with Strike-through
                              Text(
                                '₹${originalPrice.toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough, // Strike-through for original price only
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerLeft, // Aligns the buttons to the left
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start, // Ensures left alignment
                              children: [
                                // Add to Cart Button
                                ElevatedButton(
                                  onPressed: () {
                                    final cartItem = CartItem(
                                      imagePath: widget.imagePath,
                                      productName: widget.productName,
                                      price: widget.price,
                                      category: widget.category,
                                    );

                                    // Call addToCart method from CartProvider
                                    Provider.of<CartProvider>(context, listen: false)
                                        .addToCart(cartItem);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Added to Cart!'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF5A1E), // Color for the button
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    'Add to Cart',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16), // Adds spacing between the two buttons

                                // Buy Now Button
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Proceed to Buy Now!'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFBA00), // Color for the button
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    'Buy Now',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),// Add space before divider

                          // Divider before icons
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 20,
                          ),

                          // Row for icons and labels
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.restart_alt, color: Colors.black),
                                      Text(
                                        '3 days return',
                                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.local_shipping, color: Colors.black),
                                      Text(
                                        'Free delivery',
                                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.verified, color: Colors.black),
                                      Text(
                                        '3 months warranty',
                                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Icon(Icons.payment, color: Colors.black),
                                      Text(
                                        'Pay on Delivery',
                                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                // Add a subtle scroll arrow indicato
                              ],
                            ),
                          ),

                          // Divider after icons
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              color: Color(0xFFFFC5EC),
              thickness: 2,
            ),
          ),
          const SliverToBoxAdapter(child: HelpSection()),
          const SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}