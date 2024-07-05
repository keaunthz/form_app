import 'package:flutter/material.dart';

class CardTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final bool isMultiLine;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  const CardTextField({
    super.key,
    this.validator,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    required this.controller,
    this.isMultiLine = false,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(labelText),
                const Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller,
              maxLines: isMultiLine ? 3 : 1,
              decoration: InputDecoration(hintText: hintText),
              validator: validator,
              textInputAction: textInputAction,
            ),
          ],
        ),
      ),
    );
  }
}
