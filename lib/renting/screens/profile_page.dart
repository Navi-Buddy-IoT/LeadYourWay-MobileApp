import 'package:flutter/material.dart';
import 'package:lead_your_way/renting/widgets/profile_picture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(padding: EdgeInsets.all(15.0)),
          ProfilePicture(
            imagePath: "https://miro.medium.com/v2/resize:fit:785/0*Ggt-XwliwAO6QURi.jpg",
            onClick: () async {},
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 32),
          buildAbout(),
          const SizedBox(height: 32),
          buildBicycles()
        ],
      ),
      //bottomNavigationBar: const LywBottomNavigation(),
    );
  }

  Widget buildName() => const Column(
    children: [
      Text(
        "Juan Perez",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SizedBox(height: 4),
      Text(
        "example@example.com",
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildAbout() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          "This is my description..."
        )
      ],
    ),
  ); 

  Widget buildBicycles() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reserved bicycles",
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
        SizedBox(height: 24),
        Text(
          "Favorite bicycles",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),  
  );
}