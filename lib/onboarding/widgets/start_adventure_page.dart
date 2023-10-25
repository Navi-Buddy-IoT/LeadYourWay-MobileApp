import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartAdventure extends StatefulWidget {
  const StartAdventure({ Key? key }) : super(key: key);

  @override
  State<StartAdventure> createState() => _StartAdventureState();
}

class _StartAdventureState extends State<StartAdventure> {
  final image = Lottie.network(
    'https://lottie.host/0d86235e-73e8-4f50-8afc-bb7ecd04e5bc/rit7E2fOaF.json'
  );

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start your new",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
          const Text(
            "adventure",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.orange
            ),
          ),
          image,
        ],
      ),
    );
  }
}