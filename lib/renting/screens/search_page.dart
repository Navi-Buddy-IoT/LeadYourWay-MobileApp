import 'package:flutter/material.dart';
import 'package:lead_your_way/onboarding/widgets/bicycle_card.dart';
import 'package:lead_your_way/shared/widgets/lyw_bottom_navigation.dart';
import 'package:lead_your_way/shared/widgets/models/bicycle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Bicycle> hardcodedBicycles = [
    Bicycle(
      id: 1,
      bicycleDescription: "A comfortable and versatile city bike.",
      bicycleName: "City Cruiser",
      bicyclePrice: 399,
      bicycleSize: "M",
      bicycleModel: "2023 Model",
      imageData:
          "https://cdn.wikirby.com/thumb/d/d8/KSSU_Wheelie_Rider_Kirby_artwork.jpg/1200px-KSSU_Wheelie_Rider_Kirby_artwork.jpg",
    ),
    Bicycle(
      id: 2,
      bicycleDescription: "A lightweight road bike for speed enthusiasts.",
      bicycleName: "Speedster",
      bicyclePrice: 899,
      bicycleSize: "L",
      bicycleModel: "2023 Model",
      imageData:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8KsGnY5qc9IXhxlFUYPSCqf9h3kwNv4T7EOpc5eQV1rI5I-rVaUgKtoMkB7twlKxulCM&usqp=CAU",
    ),
    Bicycle(
      id: 3,
      bicycleDescription: "An all-terrain mountain bike for adventure.",
      bicycleName: "Mountain King",
      bicyclePrice: 649,
      bicycleSize: "XL",
      bicycleModel: "2023 Model",
      imageData:
          "https://thoughtcatalog.com/wp-content/uploads/2018/06/leftoverpuns-pokemon.jpg?w=1920&h=1280&crop=1",
    ),
    Bicycle(
      id: 4,
      bicycleDescription: "A stylish and practical urban commuter bike.",
      bicycleName: "Urban Explorer",
      bicyclePrice: 449,
      bicycleSize: "S",
      bicycleModel: "2023 Model",
      imageData:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa2jCAUMzi3ISQjxyjHKAD3vLHWV1_XeAS7FsZJ-x4Qf_v1R4ILWEnfxXjSGAmB-CBqTE&usqp=CAU",
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
          "https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/02/squirtle-gang.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            for (Bicycle bicycle in hardcodedBicycles)
              BicycleCard(bicycle: bicycle)
          ],
        ),
      ),
    );
  }
}
