import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final bool isPosting;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor,
    this.isPosting = false,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(10);

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
            topLeft: radius,
          ),
        ),
      ),
      onPressed: onPressed,
      child: isPosting
          ? const CircularProgressIndicator(
              color: Color.fromARGB(255, 252, 150, 82),
            )
          : Text(text),
    );
  }
}
