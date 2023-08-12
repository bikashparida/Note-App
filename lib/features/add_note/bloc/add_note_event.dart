part of 'add_note_bloc.dart';

sealed class AddNoteEvent extends Equatable {
  const AddNoteEvent();

  @override
  List<Object> get props => [];
}

class AddingNote extends AddNoteEvent {
  final NoteModel noteModel;

  const AddingNote({
    required this.noteModel,
  });

    @override
  List<Object> get props => [noteModel];
}