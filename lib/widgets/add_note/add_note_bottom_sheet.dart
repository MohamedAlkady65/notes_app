import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
              }

              if (state is AddNoteFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed To Add Note")));
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                  absorbing: state is AddNoteLoading,
                  child: const AddNoteForm());
            },
          ),
        ),
      ),
    );
  }
}
