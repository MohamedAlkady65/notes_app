import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/edit_note_cubt/edit_note_cubit.dart';
import 'package:notes_app/cudits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/edit_note/edit_note_form.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            title: "Edit Note",
            trailingicon: Icons.check,
            trailingOnTap: () {
              editNote(context);
            },
            leadingicon: Icons.arrow_back,
            leadingonTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
              child: EditNoteForm(
            note: note,
          ))
        ],
      ),
    );
  }

  void editNote(BuildContext context) {
    EditNoteCubit cubit = BlocProvider.of<EditNoteCubit>(context);
    if (cubit.formKey.currentState!.validate()) {
      note.title = cubit.title ?? note.title;
      note.content = cubit.content ?? note.content;
      note.color = cubit.color ?? note.color;
      note.save();
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      Navigator.pop(context);
    }
  }
}
