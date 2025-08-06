import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartModal extends StatelessWidget {
  const CartModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your Cart',
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (cartProvider.items.isEmpty)
            Center(
              child: Text(
                'Your cart is empty.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          item.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.productName,
                                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                              ),
                              Text('₹${item.price}', style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cartProvider.removeFromCart(index); // Use the removeFromCart method
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ₹${cartProvider.totalCost.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  cartProvider.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cart cleared!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  minimumSize: Size(double.infinity, 50), // Infinite width and height of 50
                ),
                child: Text(
                  'Clear Cart',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16), // Add spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  if (cartProvider.items.isEmpty) {
                    // Show an alert if the cart is empty
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Cart is Empty'),
                          content: const Text('Please add items to your cart before checking out.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Show an alert indicating that the feature is under development
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Under Development'),
                          content: const Text('The checkout feature is currently under development. Please check back later.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  minimumSize: Size(double.infinity, 50), // Infinite width and height of 50
                ),
                child: Text(
                  'Checkout',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}