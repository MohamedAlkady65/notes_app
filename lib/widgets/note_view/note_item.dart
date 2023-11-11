import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cudits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNoteView(
                      note: note,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 28, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.content,
                  style: TextStyle(
                      fontSize: 18, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              trailing: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  splashRadius: 24,
                  splashColor: const Color.fromARGB(255, 169, 165, 165),
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    bool? sure = await showDialog<bool>(
                        context: context,
                        builder: (context) => const SureAlert());

                    if (sure == true) {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    }
                  },
                ),
              ),
            ),
            Text(
              Jiffy.parse(note.date).format(pattern: "yyyy, MMMM dd h:mm"),
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }
}

class SureAlert extends StatelessWidget {
  const SureAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.all(16),
      title: const Text("Delete"),
      content: const Text("Are you sure to delete this note"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: kPrimaryColor, fontSize: 18),
            )),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              fixedSize: const Size.fromWidth(80)),
          child: Text(
            "Ok",
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
