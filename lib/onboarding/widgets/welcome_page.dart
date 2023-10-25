import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final image = Lottie.network(
    'https://lottie.host/73c3a565-e326-46b3-b216-143682ae84bf/doCOzH8NHo.json'
  );

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),
          ),
          const Text(
            "Lead Your Way",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.orange
            ),
          ),
          image,
          const Text(
            "Your go-to bike rental app for a convenient, efficient, and enjoyable cycling experience.", 
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}