import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cudits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/note_view/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;
          if (notes.isEmpty) {
            return const Center(
              child: Text(
                "No Notes",
                style: TextStyle(fontSize: 30),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: notes.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 5),
                itemBuilder: (context, index) => NoteItem(
                      note: notes[index],
                    ));
          }
        },
      ),
    );
  }
}
