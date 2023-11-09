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
        cursorColor: const Color(0xff424242),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xff424242)),
          icon: Icon(
            widget.icon.icon,
            color: const Color(0xff424242),
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Color(0xff424242)),
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
        cursorColor: const Color(0xff424242),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xff424242)),
          icon: Icon(
            widget.icon.icon,
            color: const Color(0xff424242),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xff424242),
            ),
          ),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Color(0xff424242)),
        controller: widget.controller,
      ),
    );
  }
}
