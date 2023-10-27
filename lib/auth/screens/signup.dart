import 'package:flutter/material.dart';
import 'package:lead_your_way/shared/widgets/lyw_rounded_input_filed.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo-lyw.png'),
            const SizedBox(height: 32),
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            RoundedInputField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hintText: "Your email",
              icon: const Icon(Icons.person),
              controller: emailController,
            ),
            RoundedInputFieldObscure(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              hintText: "Your password",
              icon: const Icon(Icons.lock),
              controller: passwordController,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
