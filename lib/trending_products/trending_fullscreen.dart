import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> item;

  const ProductDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']!),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    item['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['price']!,
                          style: const TextStyle(
                              color: Colors.green, fontSize: 22),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['subtitle']!,
                          style: const TextStyle(
                              color: Colors.green, fontSize: 22),
                        ),
                        const Text(
                          "Select Options",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        const Chip(label: Text("GMS")),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Overview",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Grocery shopping has undergone a profound transformation over the past few decades. Once a routine activity involving a trip to a local store, it has evolved into a complex and multifaceted experience shaped by technological advancements, shifting consumer preferences, and global challenges. This evolution reflects broader changes in society and highlights the growing intersection between convenience, sustainability, and technology.\n\n"
                          "Traditional Grocery Shopping\n\n"
                          "In the past, grocery shopping was a communal and often social activity. Local markets and grocery stores were hubs of community interaction, where customers knew their shopkeepers by name. These stores were typically small, with limited selections compared to today’s megastores. The emphasis was on personal service and quality, with shoppers relying on their senses—sight, smell, and touch—to select the freshest produce and best cuts of meat.\n\n",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ${item['price']!}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Define the cart button action here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    minimumSize: const Size(150, 40), // Size of the button
                  ),
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
