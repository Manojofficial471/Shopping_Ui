import 'package:dummy_project/features/home/contoller/special_controller.dart';
import 'package:dummy_project/features/home/model/cart.dart';
import 'package:dummy_project/features/home/ui/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenItemPage extends StatelessWidget {
  final Map<String, String> item;
  final int productId;

  final controller = Get.put(SpecialOfferController());

  FullscreenItemPage({super.key, required this.item, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, size: 25),
                onPressed: () {
                  print(
                      'Number of different products in the cart: ${controller.getProductCount()}');
                  Get.to(() => CartPage());
                },
              ),
              Positioned(
                  top: 1,
                  right: 2,
                  child: Obx(() => CircleAvatar(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      radius: 7,
                      child: Text(
                        "${controller.getProductCount()}",
                        style: const TextStyle(fontSize: 10),
                      ))))
            ],
          ),
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
                  SizedBox(
                    height: 300,
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
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => controller.increment(productId),
                              child: const Text("+"),
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(() => Text(
                                  "Quantity: ${controller.getCount(productId)}")),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => controller.decrement(productId),
                              child: const Text("-"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Chip(label: Text("GMS")),
                        const SizedBox(height: 5),
                        const Text(
                          "Overview",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
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
                    if (controller.getCount(productId) == 0) {
                      Get.snackbar('The Quantity is 0', '',
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      final cart = Cart(
                        description: item['price']!,
                        title: item['title']!,
                        image: item['image']!,
                        quantity: controller.getCount(productId),
                      );
                      controller.addCart(cart);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    }
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
