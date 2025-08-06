import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher package

import '../Items/footer_section.dart';
import '../Items/help_section.dart';


import '../Items/appbar.dart';

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  Future<void> _launchURL(BuildContext context, String urlString) async {
    try {
      final Uri url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open the link: $urlString')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening link: $e')),
        );
      }
    }
  }

  void _handleViewAnalytics(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Analytics Links',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://recommendationapp-9xhvzouxewkvk4vcatztkx.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Product Recommendation',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://sales-forecasting-app-trmqssbds3aukgrjdfvev9.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sales Prediction with Random Forest',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://appfraudmldsn-ermuzqwjxv3nmx9bmg9etw.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Fraud Detection',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _launchURL(context, 'https://totalquantitysalesforecastingapp-tdmceoqciemnal9gvzlsvs.streamlit.app/');
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sales Prediction with Loan Eligibility',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to launch URL in the default browse

  Future<void> _handleLogout(BuildContext context) async {
    // Remove the login state from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');

    // Navigate back to Login page using named route
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: 'Micro Mart',
            expandedHeight: 50.0,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFFAE9F5),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Welcome!',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ramesh',
                        style: GoogleFonts.poppins(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF5A1E),
                        ),
                      ),
                      Text(
                        'Kumar',
                        style: GoogleFonts.poppins(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF5A1E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Email, Location, and Phone Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email, color: Colors.black),
                          const SizedBox(width: 10),
                          Text(
                            'ramesh.kumar@example.com',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.black),
                          const SizedBox(width: 10),
                          Text(
                            'Bhopal, India',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.black),
                          const SizedBox(width: 10),
                          Text(
                            '+91 9876543210',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _handleViewAnalytics(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFBA00),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'View Analytics',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _handleLogout(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Log Out',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              color: Color(0xFFFFC5EC),
              thickness: 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: HelpSection(),
          ),
          const SliverToBoxAdapter(
            child: FooterSection(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
        ],
      ),
    );
  }
}