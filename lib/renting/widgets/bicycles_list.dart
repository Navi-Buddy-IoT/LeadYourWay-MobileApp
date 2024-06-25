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
  List<Bicycle> _bicycles = [];
  
  initialize() async {
    final bicycles = (await BicycleService().getAllBicycles()).data as List<Bicycle>;
    setState(() {
      _bicycles = bicycles;
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    if (_bicycles.isEmpty) {
      return const Center(child: Text('No bicycles available'));
    }

    return ListView.builder(
      itemCount: _bicycles.length,
      itemBuilder: (context, index) {
        return BicycleCard(bicycle: _bicycles[index]);
      },
    );
  }
}
