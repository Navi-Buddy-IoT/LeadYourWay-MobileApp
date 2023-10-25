import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LywBottomNavigation extends StatelessWidget {
  const LywBottomNavigation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: GNav(
          backgroundColor: Colors.orange,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.orangeAccent,
          padding: const EdgeInsets.all(16),
          gap: 8,
          onTabChange: (int index) {
            // TODO: Change screen based on index
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search"
            ),
            GButton(
              icon: Icons.favorite,
              text: "Favorite"
            ),
            GButton(
              icon: Icons.person,
              text: "Profile"
            ),
          ]
        ),
      ),
    );
  }
}