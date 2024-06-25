import 'package:flutter/material.dart';
import 'package:lead_your_way/onboarding/widgets/bicycle_card.dart';
import 'package:lead_your_way/shared/models/bicycle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Bicycle> hardcodedBicycles = [
    Bicycle(
        id: 1,
        bicycleName: "Lucas Bicycle 1",
        bicycleDescription: "Bicycle description for Lucas 1",
        bicyclePrice: 100,
        bicycleSize: "Large",
        bicycleModel: "Trek",
        imageData:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGbaV7wgHH6vfMiUgiGVyMQvUUN_unu0Oc4g&s",
        temperature: 20,
        velocity: 0),
    Bicycle(
        id: 2,
        bicycleName: "Lucas Bicycle 2",
        bicycleDescription: "Bicycle description for Lucas 2",
        bicyclePrice: 120,
        bicycleSize: "Medium",
        bicycleModel: "Giant",
        imageData:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv0ITM8BewtWESPOtocg-hFt-sdXtol0UCKQ&s",
        temperature: 22.5,
        velocity: 12.5),
    Bicycle(
        id: 3,
        bicycleName: "Lucas Bicycle 3",
        bicycleDescription: "Bicycle description for Lucas 3",
        bicyclePrice: 150,
        bicycleSize: "Small",
        bicycleModel: "Trek",
        imageData:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRunXVvymb9MdGcnDBojTsPccA5z4co9l5ubQ&s",
        temperature: 18.0,
        velocity: 9.0),
    Bicycle(
        id: 4,
        bicycleName: "Renter Bicycle 1",
        bicycleDescription: "Bicycle description for Renter 1",
        bicyclePrice: 110,
        bicycleSize: "Large",
        bicycleModel: "Polygon",
        imageData:
            "https://www.cnet.com/a/img/resize/d03415b3ec84abd6b5a1d049f85ef4d187d392b8/hub/2020/09/17/abed09d8-4910-4ab6-8fba-601e22431573/20200830-trek-fuel-ex-8-mountain-bike-01.jpg?auto=webp&fit=crop&height=1200&precrop=6573,4233,x0,y0&width=1200",
        temperature: 25.0,
        velocity: 12.0),
    Bicycle(
        id: 5,
        bicycleName: "Renter Bicycle 2",
        bicycleDescription: "Bicycle description for Renter 2",
        bicyclePrice: 130,
        bicycleSize: "Medium",
        bicycleModel: "Monark",
        imageData:
            "https://m.media-amazon.com/images/I/81DPZ3XfrwL._AC_UF894,1000_QL80_.jpg",
        temperature: 21.0,
        velocity: 11.0),
    Bicycle(
        id: 6,
        bicycleName: "Renter Bicycle 3",
        bicycleDescription: "Bicycle description for Renter 3",
        bicyclePrice: 160,
        bicycleSize: "Small",
        bicycleModel: "Santa Cruz",
        imageData:
            "https://images.bikesonline.com/assets/thumbL/AITPX26TRD13G1.jpg?tr=w-334,h-220",
        temperature: 19.5,
        velocity: 19.5),
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
