import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, this.onPressed, this.isLoading = false});

  final String text;
  final bool isLoading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          fixedSize: const Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: isLoading
            ?  SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  strokeWidth: 4,
                  backgroundColor: Colors.transparent,

                ))
            : Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ));
  }
}
