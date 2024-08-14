import 'package:dummy_project/trending_products/trending_data.dart';
import 'package:dummy_project/trending_products/trending_fullscreen.dart';
import 'package:flutter/material.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600, // Increased height to match SpecialOffer
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items1.length,
        itemBuilder: (context, index) {
          final item = items1[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(item: item),
                ),
              );
            },
            child: Container(
              width: 200, // Width of each item
              margin: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        item['subtitle']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        item['price']!,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                    // Add a Button at the bottom
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Define the button action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                          foregroundColor: Colors.white,
                          minimumSize: const Size(190, 30), // Text color
                        ),
                        child: const Text('ADD'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
