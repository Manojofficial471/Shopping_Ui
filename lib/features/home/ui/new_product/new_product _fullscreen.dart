import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dummy_project/features/home/contoller/cart_controller.dart';
import 'package:dummy_project/features/home/model/home_model.dart';

class ProductFullScreen extends StatelessWidget {
  final Product item;
  final int productId;

  ProductFullScreen({super.key, required this.item, required this.productId});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          SizedBox(
            width: 5,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    item.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      item.product,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Grocery shopping has undergone a profound transformation over the past few decades. Once a routine activity involving a trip to a local store, it has evolved into a complex and multifaceted experience shaped by technological advancements, shifting consumer preferences, and global challenges. This evolution reflects broader changes in society and highlights the growing intersection between convenience, sustainability, and technology.\n\n"
                      "Traditional Grocery Shopping\n\n"
                      "In the past, grocery shopping was a communal and often social activity. Local markets and grocery stores were hubs of community interaction, where customers knew their shopkeepers by name. These stores were typically small, with limited selections compared to today’s megastores. The emphasis was on personal service and quality, with shoppers relying on their senses—sight, smell, and touch—to select the freshest produce and best cuts of meat.\n\n",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () {
              final count = cartController.getCount(productId);
              return Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: 150",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.snackbar('added to cart', '',
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(count > 0 ? 'Update Cart' : 'Add to Cart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
