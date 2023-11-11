import 'package:flutter/material.dart';
import 'package:lead_your_way/renting/screens/rent_page.dart';
import 'package:lead_your_way/shared/models/bicycle.dart';

class BicycleCard extends StatelessWidget {
  final Bicycle bicycle;

  BicycleCard({required this.bicycle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            bicycle.imageData, // Assuming you have image URLs in your model.
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bicycle.bicycleName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bicycle.bicycleDescription,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price: \$${bicycle.bicyclePrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('Size: ${bicycle.bicycleSize}',
                            style: const TextStyle(fontSize: 16)),
                        Text('Model: ${bicycle.bicycleModel}',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const Spacer(), // Pushes "Rent" button to the right
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RentPage(bicycle: bicycle)));
                      },
                      child: const Text("Rent"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
