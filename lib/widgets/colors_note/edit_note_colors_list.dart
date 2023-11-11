import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/edit_note_cubt/edit_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_note/color_item.dart';
import 'package:notes_app/widgets/colors_note/colors.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                    BlocProvider.of<EditNoteCubit>(context).color =
                        colors[index].value;
                  },
                )),
      ),
    );
  }
}
