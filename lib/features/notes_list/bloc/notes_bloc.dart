import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/data/repository/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesRepository notesRepository = NotesRepository();

  NotesBloc() : super(NotesInitial()) {
    on<GetNotes>(onGetNotes);
  }

  void onGetNotes(GetNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      final data = await notesRepository.getAllNotes();
      emit(NotesLoaded(data));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
