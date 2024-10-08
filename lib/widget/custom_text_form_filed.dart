import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onPressed,
    required this.obscureText,
    this.onChanged,
    this.InputType,
  });

  final String hintText;
  final InputType;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              obscureText: obscureText,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
