import 'package:flutter/material.dart';
import 'package:lead_your_way/onboarding/widgets/bicycle_card.dart';
import 'package:lead_your_way/renting/widgets/bicycles_list.dart';
import 'package:lead_your_way/shared/models/bicycle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  /*List<Bicycle> hardcodedBicycles = [
    Bicycle(
      id: 1,
      bicycleDescription: "A comfortable and versatile city bike.",
      bicycleName: "City Cruiser",
      bicyclePrice: 399,
      bicycleSize: "M",
      bicycleModel: "2023 Model",
      imageData:
          "https://www.wheelbase.co.uk/wp-content/uploads/2019/06/Feature-Image.jpg",
    ),
    Bicycle(
      id: 2,
      bicycleDescription: "A lightweight road bike for speed enthusiasts.",
      bicycleName: "Speedster",
      bicyclePrice: 899,
      bicycleSize: "L",
      bicycleModel: "2023 Model",
      imageData:
          "https://hips.hearstapps.com/hmg-prod/images/bke040123gertrekfuelexe-004-642d98697b6b4.jpg",
    ),
    Bicycle(
      id: 3,
      bicycleDescription: "An all-terrain mountain bike for adventure.",
      bicycleName: "Mountain King",
      bicyclePrice: 649,
      bicycleSize: "XL",
      bicycleModel: "2023 Model",
      imageData:
          "https://www.bikegeardatabase.com/stories/vintage-biker/gt-spinergy.jpeg",
    ),
    Bicycle(
      id: 4,
      bicycleDescription: "A stylish and practical urban commuter bike.",
      bicycleName: "Urban Explorer",
      bicyclePrice: 449,
      bicycleSize: "S",
      bicycleModel: "2023 Model",
      imageData:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/allied-bc40-mountain-bike-review-lead-1663794038.jpg",
    ),
    Bicycle(
      id: 5,
      bicycleDescription:
          "A high-performance hybrid bike for fitness enthusiasts.",
      bicycleName: "Hybrid Pro",
      bicyclePrice: 699,
      bicycleSize: "M",
      bicycleModel: "2023 Model",
      imageData:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/allied-bc40-mountain-bike-review-lead-1663794038.jpg",
    ),
  ];*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: const [
            BicycleList()
          ],
        ),
      ),
    );
  }
}
