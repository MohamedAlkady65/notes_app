import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cudits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_note/add_note_colors_list.dart';
import 'package:notes_app/widgets/custom_widgets/custom_bottom.dart';
import 'package:notes_app/widgets/custom_widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? title;
  String? content;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            labelText: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: "Content",
            maxLines: 5,
            onSaved: (value) {
              content = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const AddNoteColorsList(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                text: "Add",
                isLoading: state is AddNoteLoading,
                onPressed: addNote,
              );
            },
          )
        ],
      ),
    );
  }

  void addNote() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      NoteModel note = NoteModel(
          title: title!,
          content: content!,
          date: DateTime.now().toString(),
          color: BlocProvider.of<AddNoteCubit>(context).color.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
