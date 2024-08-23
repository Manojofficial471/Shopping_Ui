import 'package:dummy_project/features/home/contoller/home_controller.dart';
import 'package:flutter/material.dart';
// Correct the import path if necessary
import 'package:dummy_project/features/home/model/home_model.dart'; // Correct the import path if necessary

class CategoryAvatar extends StatelessWidget {
  const CategoryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCategoryController controller = HomeCategoryController();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/special.png'),
              radius: 35,
              backgroundColor: Colors.white,
            ),
            Expanded(
              child: FutureBuilder<List<HomeCategory>>(
                future: controller.fetchHomeCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No categories found.'));
                  } else {
                    final categories = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(category.dpImgPath),
                                radius: 35,
                                backgroundColor: Colors.transparent,
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                category.dpName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
