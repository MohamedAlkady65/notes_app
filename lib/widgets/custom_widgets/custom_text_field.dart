import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.maxLines = 1,
      this.onSaved,
      this.initialValue, this.onChanged});
  final String labelText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field Is Requierd";
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        enabledBorder: buildBorder(color: Colors.white),
        focusedBorder: buildBorder(color: kPrimaryColor),
        errorBorder: buildBorder(color: kPrimaryColor),
        focusedErrorBorder: buildBorder(color: kPrimaryColor),
        label: Text(
          labelText,
          style: const TextStyle(color: kPrimaryColor),
        ),
      ),
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
    );
  }

  OutlineInputBorder buildBorder({color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? kPrimaryColor),
        borderRadius: BorderRadius.circular(8));
  }
}
