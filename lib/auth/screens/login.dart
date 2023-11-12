import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lead_your_way/auth/provider/auth_provider.dart';
import 'package:lead_your_way/auth/provider/login_provider.dart';
import 'package:lead_your_way/auth/screens/signup.dart';
import 'package:lead_your_way/renting/screens/home_page.dart';
import 'package:lead_your_way/shared/services/Smooth_Navigation.dart';
import 'package:lead_your_way/shared/services/notifier.dart';
import 'package:lead_your_way/shared/widgets/lyw_custom_button.dart';
import 'package:lead_your_way/shared/widgets/lyw_navigator.dart';
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
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo-lyw.png',
              width: 125,
              height: 125,
            ),
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
                "Welcome Back!",
                style: TextStyle(fontSize: 24, color: Color(0xff424242)),
              ),
            ),
            const SizedBox(height: 32),
            _LoginForm(emailController, passwordController),
            const SizedBox(height: 96),
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
            smoothNavigation(
              context,
              const Login(),
              const SignUp(),
              -1.0,
              0.0,
              1.0,
              0.0,
            );
          },
          child: const Text(
            "Sign up",
            style: TextStyle(
              color: Color.fromARGB(255, 238, 163, 113),
              backgroundColor: Color.fromARGB(0, 138, 132, 132),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm(this.emailController, this.passwordController);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) {
        return;
      }
      showSnackBar(context, next.errorMessage);
    });

    return Column(
      children: [
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
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: CustomButton(
            text: 'Ingresar',
            onPressed: loginForm.isPosting
                ? null
                : ref.read(loginFormProvider.notifier).onFormSubmit,
            isPosting: loginForm.isPosting,
          ),
        )
        // FilledButton(
        //   onPressed: () {
        //     final email = emailController.text;
        //     final password = passwordController.text;
        //     final bool emailValid = RegExp(
        //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        //         .hasMatch(email);

        //     if (email.isEmpty || password.isEmpty) {
        //       sendAlertMessage("Please fill all the fields");
        //       return;
        //     }

        //     if (!emailValid) {
        //       sendAlertMessage("Please enter a valid email address");
        //       return;
        //     }

        //     smoothNavigation(
        //       context,
        //       const Login(),
        //       const LywNavigator(),
        //       0.0,
        //       -1.0,
        //       0.0,
        //       1.0,
        //     );
        //   },
        //   style: FilledButton.styleFrom(
        //     backgroundColor: const Color.fromARGB(255, 252, 150, 82),
        //     foregroundColor: Colors.white,
        //     fixedSize: const Size(200, 50),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(32),
        //     ),
        //   ),
        //   child: const Text("Login"),
        // ),
      ],
    );
  }
}
