import 'package:flutter/material.dart';
import 'package:lead_your_way/onboarding/widgets/bicycle_card.dart';
import 'package:lead_your_way/renting/services/bicycle_service.dart';
import 'package:lead_your_way/shared/models/bicycle.dart';

class BicycleList extends StatefulWidget {
  const BicycleList({super.key});

  @override
  State<BicycleList> createState() => _BicycleListState();
}

class _BicycleListState extends State<BicycleList> {
  BicycleService? _bicycleService;
  List<Bicycle> _bicycles = [];

  @override
  void initState() {
    _bicycleService = BicycleService();
    _fetchPage();
    super.initState();
  }

  Future _fetchPage() async {
    try {
      final bicycles = (await _bicycleService!.getAllBicycles()).data as List<Bicycle>;
      setState(() {
        _bicycles = bicycles;
      });
    } catch (error) {
      print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: _bicycles.map((bicycle) => BicycleCard(bicycle: bicycle)).toList()
    );
  }
}