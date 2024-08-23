import 'package:dummy_project/features/bottom_nav/ui/bottom-nav.dart';
import 'package:dummy_project/features/home/contoller/cart_controller.dart';
import 'package:dummy_project/features/home/ui/cart_page.dart';
import 'package:dummy_project/features/home/ui/new_product/new_products.dart';

import 'package:dummy_project/features/home/ui/trending_products/trending_products.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'catergory_avatar.dart';
import 'special_Offer.dart/special_offer.dart';
import 'popular_brands_grid.dart';

class HomeScreen extends StatefulWidget {
  final TextEditingController search = TextEditingController();

  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(CartController());

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategoryAvatar(),
            const SizedBox(height: 8.0),
            _buildCarouselSlider(),
            const SizedBox(height: 8.0),
            _buildSectionTitle("Top Most Popular Brands"),
            const PopularBrandsGrid(),
            const SizedBox(height: 8.0),
            _buildSectionTitle("Special Offers"),
            SizedBox(height: 250, child: SpecialOffer()),
            _buildSectionTitle("Trending Products"),
            SizedBox(height: 250, child: TrendingProducts()),
            _buildSectionTitle("New Products"),
            SizedBox(
              height: 250,
              child: HomeProducts(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Sarkar Shopping',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Delivery Slot", style: TextStyle(fontSize: 10)),
                  Text("9:00 - 10:00",
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ],
              ),
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
                            style: TextStyle(fontSize: 10),
                          ))))
                ],
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.search,
            decoration: InputDecoration(
              hintText: "Search Drinks, Snacks, etc",
              prefixIcon: const Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: [
        'assets/Banner.jpg',
      ]
          .map((item) => Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
