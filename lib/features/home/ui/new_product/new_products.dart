import 'package:dummy_project/features/home/contoller/home_controller.dart';
import 'package:dummy_project/features/home/contoller/cart_controller.dart';
import 'package:dummy_project/features/home/model/home_model.dart';
import 'package:dummy_project/features/home/ui/new_product/new_product%20_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProducts extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final HomeCategoryController homeCategoryController =
      Get.put(HomeCategoryController());

  HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: homeCategoryController.fetchHomeProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No products available.'));
        } else {
          final products = snapshot.data!;
          return SizedBox(
            height: 600,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                final productId = index;

                return GestureDetector(
                  onTap: () {
                    Get.to(() => ProductFullScreen(
                          item: item,
                          productId: productId,
                        ));
                  },
                  child: Stack(
                    children: [
                      Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.network(
                                  item.imagePath,
                                  fit: BoxFit.contain,
                                  width: 300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                item.product,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                item.brandName,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                            Center(
                                child: ElevatedButton(
                              onPressed: () {
                                cartController.increment(productId);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(190, 30),
                              ),
                              child: const Text('ADD'),
                            )),
                          ],
                        ),
                      ),
                      const Positioned(
                        top: 15.0,
                        right: 13.0,
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
