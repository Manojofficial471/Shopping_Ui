import 'package:dummy_project/features/home/contoller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dummy_project/data/trending_data.dart';
import 'package:dummy_project/features/home/model/cart.dart';

class TrendingProducts extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  TrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items1.length,
        itemBuilder: (context, index) {
          final item = items1[index];
          final productId = index;

          return GestureDetector(
            onTap: () {
              Get.toNamed(
                '/product_fullscreen',
                arguments: {'item': item, 'productId': productId},
              );
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
                          child: Image.asset(
                            item['image']!,
                            fit: BoxFit.contain,
                            width: 250,
                          ),
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
                      Center(
                        child: Obx(
                          () {
                            final count = cartController.getCount(productId);
                            return count > 0
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          cartController.increment(productId);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size(60, 30),
                                        ),
                                        child: const Text('+'),
                                      ),
                                      const SizedBox(width: 10),
                                      Text("$count"),
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          cartController.decrement(productId);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size(60, 30),
                                        ),
                                        child: const Text('-'),
                                      ),
                                    ],
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      cartController.increment(productId);
                                      final cart = Cart(
                                        description: item['price']!,
                                        title: item['title']!,
                                        image: item['image']!,
                                        quantity: productId,
                                      );
                                      cartController.addCart(cart);
                                      print(
                                          "success ${cartController.cartProducts}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(190, 30),
                                    ),
                                    child: const Text('ADD'),
                                  );
                          },
                        ),
                      ),
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
}
