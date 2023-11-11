import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/widgets/custom_widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/note_view/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomAppBar(
            title: "Notes",
            trailingicon: Icons.exit_to_app,
            trailingOnTap: () {
              SystemNavigator.pop();
            },
          ),
          const Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
