import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> _notes = [];
  void fetchAllNotes() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    _notes = notesBox.values.toList().reversed.toList();
    emit(NotesSuccess());
  }

  List<NoteModel> get notes => _notes;
}
