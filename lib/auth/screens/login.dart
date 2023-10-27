import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lead_your_way/auth/screens/signup.dart';
import 'package:lead_your_way/renting/screens/home_page.dart';
import 'package:lead_your_way/shared/code/lyw_navigation.dart';
import 'package:lead_your_way/shared/widgets/lyw_rounded_input_filed.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text(
                "Welcome to login",
                style: TextStyle(fontSize: 24),
              ),
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
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email);
                if (email.isEmpty || password.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Please fill all the fields",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.orangeAccent,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else if (!emailValid) {
                  Fluttertoast.showToast(
                    msg: "Please enter a valid email address",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.orangeAccent,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
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
              child: const Text("Login"),
            ),
            const SizedBox(height: 16),
            SignUpLink(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row SignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            navigateToScreen(context, const SignUp(), const Offset(1, 0));
          },
          child: const Text(
            "Sign up",
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
