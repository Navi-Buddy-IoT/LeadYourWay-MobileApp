import 'package:flutter/material.dart';
import 'package:lead_your_way/renting/screens/home_page.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to login", textAlign: TextAlign.center,),
            const SizedBox(height: 32,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const HomePage())
                );
              },
              child: const Text("Go to Home")
            )
          ],
        ),
      )
    );
  }
}