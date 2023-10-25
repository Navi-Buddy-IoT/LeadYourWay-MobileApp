import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FindBikes extends StatefulWidget {
  const FindBikes({ Key? key }) : super(key: key);

  @override
  State<FindBikes> createState() => _FindBikesState();
}

class _FindBikesState extends State<FindBikes> {
  final image = Lottie.network(
    'https://lottie.host/92a9c1ea-4abb-4e04-8cf6-3dce74b2b3ba/kEE0fbsoaX.json'
  );

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find bikes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
                ),
              ),
              SizedBox(width: 8,),
              Text(
                "easily",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.orange
                ),
              ),
            ],
          ),
          image,
          const Text(
            "Find the right bike for your needs", 
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}