import 'package:dummy_project/catergory_avatar/categoryavatar_data.dart';
import 'package:flutter/material.dart';

class CategoryAvatar extends StatelessWidget {
  const CategoryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            // Special Avatar
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/special.png'),
                radius: 35,
                backgroundColor: Colors.transparent,
              ),
            ),
            // List of Category Avatars
            Expanded(
              child: ListView.builder(
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
                          backgroundImage: AssetImage(category['url']!),
                          radius: 35,
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          category['name']!,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
