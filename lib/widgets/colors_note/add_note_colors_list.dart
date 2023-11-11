import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/colors_note/color_item.dart';
import 'package:notes_app/widgets/colors_note/colors.dart';

class AddNoteColorsList extends StatefulWidget {
  const AddNoteColorsList({super.key});

  @override
  State<AddNoteColorsList> createState() => _AddNoteColorsListState();
}

class _AddNoteColorsListState extends State<AddNoteColorsList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<ColorItem>.generate(
            colors.length,
            (index) => ColorItem(
                  color: colors[index],
                  selected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    BlocProvider.of<AddNoteCubit>(context).color =
                        colors[index];
                  },
                )),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 30 * 2,
  //     child: ListView.builder(
  //       physics: const NeverScrollableScrollPhysics(),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: colors.length,
  //       itemBuilder: (context, index) => ColorItem(
  //         color: colors[index],
  //         selected: selectedIndex == index,
  //         onTap: () {
  //           setState(() {
  //             selectedIndex = index;
  //           });
  //           BlocProvider.of<AddNoteCubit>(context).color = colors[index];
  //         },
  //       ),
  //     ),
  //   );
  // }
}
