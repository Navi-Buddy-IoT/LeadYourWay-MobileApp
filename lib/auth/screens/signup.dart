import 'package:flutter/material.dart';
import 'package:lead_your_way/auth/screens/login.dart';
import 'package:lead_your_way/shared/services/Notifier.dart';
import 'package:lead_your_way/shared/widgets/lyw_rounded_input_filed.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo-lyw.png',
              width: 150,
              height: 150,
            ),
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
              textInputAction: TextInputAction.next,
              hintText: "Your password",
              icon: const Icon(Icons.lock),
              controller: passwordController,
            ),
            RoundedInputFieldObscure(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              hintText: "Confirm Password",
              icon: const Icon(Icons.lock),
              controller: passwordConfirmationController,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                final passwordConfirmation =
                    passwordConfirmationController.text;
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email);

                if (email.isEmpty ||
                    password.isEmpty ||
                    passwordConfirmation.isEmpty) {
                  sendAlertMessage("Please fill all fields");
                  return;
                }

                if (!emailValid) {
                  sendAlertMessage("Please enter a valid email address");
                  return;
                }

                if (password != passwordConfirmation) {
                  sendAlertMessage("Your password does not match");
                  return;
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 32),
            LoginLink(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row LoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Login()));
          },
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.orange,
              backgroundColor: Color.fromARGB(0, 138, 132, 132),
            ),
          ),
        ),
      ],
    );
  }
}
