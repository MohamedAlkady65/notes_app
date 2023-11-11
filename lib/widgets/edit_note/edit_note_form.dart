import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/edit_note_cubt/edit_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_note/edit_note_colors_list.dart';
import 'package:notes_app/widgets/custom_widgets/custom_text_field.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Form(
        key: BlocProvider.of<EditNoteCubit>(context).formKey,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          CustomTextField(
            labelText: "Title",
            initialValue: note.title,
            onChanged: (value) {
              BlocProvider.of<EditNoteCubit>(context).title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: "Content",
            maxLines: 5,
            initialValue: note.content,
            onChanged: (value) {
              BlocProvider.of<EditNoteCubit>(context).content = value;
            },
          ),
          const Spacer(
            flex: 1,
          ),
          EditNoteColorsList(note: note)
        ]),
      ),
    );
  }
}
