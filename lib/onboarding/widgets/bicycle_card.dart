import 'package:flutter/material.dart';
import 'package:lead_your_way/shared/widgets/models/bicycle.dart';

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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bicycle.bicycleDescription,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price: \$${bicycle.bicyclePrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text('Size: ${bicycle.bicycleSize}',
                            style: TextStyle(fontSize: 16)),
                        Text('Model: ${bicycle.bicycleModel}',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Spacer(), // Pushes "Rent" button to the right
                    ElevatedButton(
                      onPressed: () {
                        // Add your rent functionality here
                        // For example, you can navigate to a rent screen.
                      },
                      child: Text("Rent"),
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
