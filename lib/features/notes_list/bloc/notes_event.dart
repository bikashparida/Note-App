// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_bloc.dart';

sealed class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class GetNotes extends NotesEvent {
  const GetNotes();
}
