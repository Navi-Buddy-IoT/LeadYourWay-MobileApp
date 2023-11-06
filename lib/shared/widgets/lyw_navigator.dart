import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lead_your_way/renting/screens/home_page.dart';
import 'package:lead_your_way/renting/screens/profile_page.dart';
import 'package:lead_your_way/renting/screens/search_page.dart';
import 'package:lead_your_way/shared/widgets/lyw_bottom_navigation.dart';

class LywNavigator extends StatefulWidget {
  const LywNavigator({super.key});

  @override
  State<LywNavigator> createState() => _LywNavigatorState();
}

class _LywNavigatorState extends State<LywNavigator> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
    const SearchPage()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[_currentIndex]),
      bottomNavigationBar: LywBottomNavigation(onNavigationChange: _onTabTapped),
    );
  }
}
