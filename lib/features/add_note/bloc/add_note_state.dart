part of 'add_note_bloc.dart';

sealed class AddNoteState extends Equatable {
  const AddNoteState();

  @override
  List<Object> get props => [];
}

final class AddNoteInitial extends AddNoteState {}

final class AddingNoteLoad extends AddNoteState {
  @override
  List<Object> get props => [];
}

final class AddingNoteSuccess extends AddNoteState {
  @override
  List<Object> get props => [];
}

final class AddingNoteError extends AddNoteState {
  final String error;

  const AddingNoteError(this.error);
  @override
  List<Object> get props => [error];
}
