import 'package:flutter/material.dart';
import 'package:lead_your_way/shared/widgets/lyw_text_filled_container.dart';

class RoundedInputField extends StatefulWidget {
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;

  const RoundedInputField(
      {super.key,
      required this.keyboardType,
      required this.textInputAction,
      required this.hintText,
      required this.icon,
      required this.controller});

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          icon: Icon(
            widget.icon.icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.white),
        controller: widget.controller,
      ),
    );
  }
}

class RoundedInputFieldObscure extends StatefulWidget {
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;

  RoundedInputFieldObscure({
    Key? key,
    required this.keyboardType,
    required this.textInputAction,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  _RoundedInputFieldObscureState createState() =>
      _RoundedInputFieldObscureState();
}

class _RoundedInputFieldObscureState extends State<RoundedInputFieldObscure> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        obscureText: obscureText,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          icon: Icon(
            widget.icon.icon,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.white),
        controller: widget.controller,
      ),
    );
  }
}
