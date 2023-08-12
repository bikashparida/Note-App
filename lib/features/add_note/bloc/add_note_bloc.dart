import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/data/repository/notes_repository.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
    NotesRepository notesRepository = NotesRepository();

  AddNoteBloc() : super(AddNoteInitial()) {
    on<AddingNote>(onAddingNote);
  }

  void onAddingNote(AddingNote event, Emitter<AddNoteState> emit) async {
    emit(AddingNoteLoad());
    try {
      await notesRepository.addANote(noteModel: event.noteModel);
      emit(AddingNoteSuccess());
    } catch (e) {
      emit(AddingNoteError(e.toString()));
    }
  }
}
