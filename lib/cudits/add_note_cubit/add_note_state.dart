part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  AddNoteFailure(this._message);

  final String _message;

  String get message => _message;
}
