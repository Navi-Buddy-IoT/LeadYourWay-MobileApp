import 'package:flutter/material.dart';
import 'package:lead_your_way/shared/models/bicycle.dart';

class RentedPage extends StatelessWidget {
  const RentedPage({super.key, required this.bicycle});
  final Bicycle bicycle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rented Bicycle!!!'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are currently using the bicycle :)',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              bicycle.bicycleName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Current temperature: ${bicycle.temperature} °C',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Current speed: ${bicycle.velocity} km/h',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Image.network(
              bicycle.imageData,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Error al cargar la imagen');
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton (
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Finish rent'),
              ),
          ],
        ),
      ),
    );
  }
}