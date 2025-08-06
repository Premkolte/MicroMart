import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Items/collection_box.dart';
import 'package:msme_exhibition/Items/footer_section.dart';
import 'package:msme_exhibition/Items/help_section.dart';
import 'package:msme_exhibition/Screens/all_products_screen.dart';

import '../Dataset/box_data.dart';
import '../Items/appbar.dart';
import '../Items/capsule.dart';  // Import Capsule widget
import '../Items/rounded_box.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMoreCapsules = false;
  List shuffledDataset = List.of(boxDataset)..shuffle();


  @override
  Widget build(BuildContext context) {
    List<Widget> roundedBoxes = shuffledDataset.take(6).map((box) => RoundedBox(
      imagePath: box.imagePath,
      productName: box.productName,
      price: box.price,
      category: box.category,
      description: box.description,
    )).toList();

    // Default capsules
    List<Capsule> capsules = [
      const Capsule(text: "All", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Men", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Women", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Electronics", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Accessories", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Beauty", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Sports", textColor: Colors.black, borderColor: Colors.black),
    ];

    // Only show the first four capsules by default
    List<Capsule> displayedCapsules = capsules.take(4).toList();
    List<Capsule> additionalCapsules = capsules.sublist(4);

    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          CustomSliverAppBar(
            title: 'Micro Mart',
            expandedHeight: MediaQuery.of(context).size.height * 0.8,
            backgroundImage: 'images/app-images/hero-1.jpeg',
            subtitle:
            'ACCESS RESOURCES, TOOLS, AND\nSUPPORT TAILORED TO\nYOUR BUSINESS NEEDS.',
          ),

          // Sliver for the rest of the content
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 5.0),
                child: Text(
                  "Quick View",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFFF5A1E),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0, bottom: 10.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Wrap widget for default and additional capsules
                        Column(
                          children: [
                            // First Row for default capsules (4 capsules)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (int i = 0; i < displayedCapsules.length; i++) ...[
                                  displayedCapsules[i],
                                  if (i != displayedCapsules.length - 1) const SizedBox(width: 8),
                                ],
                                // Arrow button beside the last capsule (Electronics)
                                IconButton(
                                  icon: Icon(
                                    showMoreCapsules ? Icons.arrow_downward : Icons.arrow_forward,
                                    color: const Color(0xFFFF5A1E),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showMoreCapsules = !showMoreCapsules;
                                    });
                                  },
                                ),
                              ],
                            ),
                            // If 'showMoreCapsules' is true, show additional capsules below
                            if (showMoreCapsules)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < additionalCapsules.length; i++) ...[
                                    additionalCapsules[i],
                                    if (i != additionalCapsules.length - 1) const SizedBox(width: 8),
                                  ],
                                ],
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Rounded border boxes below capsules
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int boxesPerRow = constraints.maxWidth > 800 ? 3 : 2;
                    List<Widget> rows = [];
                    for (int i = 0; i < roundedBoxes.length; i += boxesPerRow) {
                      rows.add(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int j = i; j < i + boxesPerRow && j < roundedBoxes.length; j++) ...[
                              Expanded(child: roundedBoxes[j]),
                              if (j < i + boxesPerRow - 1) const SizedBox(width: 16),
                            ],
                          ],
                        ),
                      );
                      if (i + boxesPerRow < roundedBoxes.length) {
                        rows.add(const SizedBox(height: 16));
                      }
                    }

                    return Column(
                      children: rows,
                    );
                  },
                ),
              ),

              // "Collections" section below the boxes
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 5.0),
                child: Text(
                  "Collections",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFFF5A1E),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the category screen for 'Men'
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryScreen(category: 'Men'),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: RoundedRectangle(
                    imagePath: 'images/app-images/men_collection.jpg',
                    height: 250.0,
                    labelText: 'Men',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the category screen for 'Women'
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(category: 'Women'),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: RoundedRectangle(
                    imagePath: 'images/app-images/women_collection.jpg',
                    height: 250.0,
                    labelText: 'Women',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the category screen for 'Electronics'
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(category: 'Electronics'),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: RoundedRectangle(
                    imagePath: 'images/app-images/electronics_collection.jpg',
                    height: 250.0,
                    labelText: 'Electronics',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryScreen(category: 'Jewellery')),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: RoundedRectangle(
                    imagePath: 'images/app-images/jewellery_collection.jpg',
                    height: 250.0,
                    labelText: 'Jewellery',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AllProductsScreen()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: RoundedRectangle(
                    imagePath: 'images/app-images/all_collection.jpg',
                    height: 450.0,
                    labelText: 'All',
                  ),
                ),
              ),
              const Divider(
                color: Color(0xFFFFC5EC),
                thickness: 2,
                height: 40,
                indent: 20,
                endIndent: 20,
              ),
            ]),
          ),

          // Footer
          const SliverToBoxAdapter(child: HelpSection()),
          const SliverToBoxAdapter(child: FooterSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
        ],
      ),
    );
  }
}