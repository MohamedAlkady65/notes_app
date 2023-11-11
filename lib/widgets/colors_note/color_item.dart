import 'package:flutter/material.dart';
import 'package:notes_app/widgets/colors_note/colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.color, required this.selected, this.onTap});
  final Color color;
  final bool selected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double width =
        (((MediaQuery.of(context).size.width - 40) / colors.length) - 10) / 2;
    width = width > 30 ? 30 : width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CircleAvatar(
          radius: width,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: selected ? width - (width / 8) : width,
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
