import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dummy_project/features/home/contoller/cart_controller.dart';
import 'package:dummy_project/features/home/contoller/special_controller.dart';

class CartPage extends StatelessWidget {
  final CartController _cartController = Get.put(CartController());
  final SpecialOfferController _specialOfferController =
      Get.put(SpecialOfferController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Obx(() {
        final combinedProducts = [
          ..._cartController.cartProducts,
          ..._specialOfferController.cartProducts,
        ];

        if (combinedProducts.isEmpty) {
          return _buildEmptyCart();
        } else {
          return _buildCartList(combinedProducts);
        }
      }),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
          SizedBox(height: 16),
          Text('No products in cart',
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          SizedBox(height: 8),
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Start Shopping'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(List<dynamic> products) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final cartIndex = products[index];
                print('Image path: ${cartIndex.image}');
                print('Title: ${cartIndex.title}');
                print('Description: ${cartIndex.description}');
                print('Quantity: ${cartIndex.quantity}');

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      cartIndex.image,
                      height: 50,
                      width: 50,
                    ),
                    title: Text(cartIndex.title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Row(
                      children: [
                        Text(cartIndex.description),
                        SizedBox(width: 10),
                        // Optionally include Quantity
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _cartController.removeItem(index);
                        _specialOfferController.removeItem(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout logic here
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Proceed to Checkout'),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
