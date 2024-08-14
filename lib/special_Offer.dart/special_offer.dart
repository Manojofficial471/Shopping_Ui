import 'package:dummy_project/special_Offer.dart/special_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/special_Offer.dart/special_data.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data_special.length,
      itemBuilder: (context, index) {
        final item = data_special[index];
        return Container(
          width: 200,
          height: 600, // Increased height of each item
          margin: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullscreenItemPage(item: item),
              ),
            ),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
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
                  // Add a Button at the bottom
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        foregroundColor: Colors.white,
                        minimumSize: const Size(190, 30), // Text color
                      ),
                      child: const Text('ADD'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
