import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_app/data/models/note_model.dart';

class NotesRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addANote({required NoteModel noteModel}) async {
    try {
      await _firebaseFirestore.collection("notes").add(noteModel.toMap());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('exception');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NoteModel>> getAllNotes() async {
    final List<NoteModel> notesList = [];
    try {
      final allNotes = await _firebaseFirestore.collection("notes").get();
      for (var element in allNotes.docs) {
          notesList.add(
            NoteModel.fromMap(element.data()),
          );
        }
      return notesList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('exception');
      }
      return notesList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
