import 'package:dummy_project/features/home/model/cart.dart';
import 'package:get/get.dart';

class SpecialOfferController extends GetxController {
  var productCounts = <int, RxInt>{}.obs;
  RxList<Cart> cartProducts = <Cart>[].obs;

  void increment(int productId) {
    if (productCounts.containsKey(productId)) {
      productCounts[productId]!.value++;
    } else {
      productCounts[productId] = 1.obs;
    }
  }

  void decrement(int productId) {
    if (productCounts.containsKey(productId)) {
      var currentCount = productCounts[productId]!;
      if (currentCount.value > 0) {
        currentCount.value--;
      }
    }
  }

  int getCount(int productId) {
    return productCounts[productId]?.value ?? 0;
  }

  void addCart(Cart cart) {
    cartProducts.add(cart);
  }

  void removeItem(int index) {
    if (index >= 0 && index < cartProducts.length) {
      cartProducts.removeAt(index);
    }
  }

  int getProductCount() {
    return productCounts.length;
  }
}
