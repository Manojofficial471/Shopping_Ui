import 'package:flutter/material.dart';

class FullscreenItemPage extends StatelessWidget {
  final Map<String, String> item;

  const FullscreenItemPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with a fixed height to maintain aspect ratio
                  SizedBox(
                    height:
                        300, // You can adjust this height based on your design needs
                    width: double.infinity,
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['price']!,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.green),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['subtitle']!,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
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
                  'Total: ${item['price']}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Define cart button action here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to cart!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
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
