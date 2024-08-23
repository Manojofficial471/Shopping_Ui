import 'package:dummy_project/login/ui/login.dart';
import 'package:dummy_project/features/home/ui/home_screen.dart';
import 'package:dummy_project/features/home/ui/special_Offer.dart/special_fullscreen.dart';
import 'package:dummy_project/features/home/ui/trending_products/trending_fullscreen.dart';
import 'package:dummy_project/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> getRoutes() => [
        GetPage(
          name: route_name.intial,
          page: () => LoginPage(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
        ),
        GetPage(
          name: route_name.HomeScreen,
          page: () => HomeScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
        ),
        GetPage(
          name: route_name.FullscreenItemPage,
          page: () {
            final args = Get.arguments as Map<String, dynamic>;
            return FullscreenItemPage(
              item: args['item'],
              productId: args['productId'],
            );
          },
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(seconds: 1),
        ),
        GetPage(
          name: route_name.ProductDetailScreen,
          page: () {
            final args = Get.arguments as Map<String, dynamic>;
            return ProductDetailScreen(
              item: args['item'],
              productId: args['productId'],
            );
          },
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(seconds: 1),
        ),
      ];
}
