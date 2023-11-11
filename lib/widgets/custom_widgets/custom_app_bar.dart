import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_widgets/custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.trailingicon,
      this.trailingOnTap,
      this.leadingonTap,
      this.leadingicon});

  final String title;
  final IconData trailingicon;
  final IconData? leadingicon;
  final void Function()? trailingOnTap;
  final void Function()? leadingonTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingicon != null
              ? Row(
                  children: [
                    CustomAppBarIcon(
                      icon: leadingicon!,
                      onTap: leadingonTap,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: const TextStyle(fontSize: 32),
                ),
          CustomAppBarIcon(
            icon: trailingicon,
            onTap: trailingOnTap,
          )
        ],
      ),
    );
  }
}
