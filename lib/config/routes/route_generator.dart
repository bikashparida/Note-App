import 'package:flutter/material.dart';
import 'package:notes_app/config/routes/route_names.dart';
import 'package:notes_app/features/add_note/page/add_note_page.dart';
import 'package:notes_app/features/notes_list/page/notes_listing_page.dart';
import 'package:notes_app/features/view_note/page/view_note_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String url = settings.name ?? '/';
    switch (url) {
      case '/':
        return _GeneratePage(widget: Container(), rName: url);
      case RouteNames.notesListingPageRoute:
        return _GeneratePage(widget: const NotesListingPage(), rName: url);
      case RouteNames.addNotePageRoute:
        return _GeneratePage(widget: const AddNotePage(), rName: url);
      case RouteNames.viewNotePageRoute:
      var arguments = settings.arguments as Map<String, dynamic>;
        return _GeneratePage(widget: ViewNotePage(
          title: arguments['title'],
          description: arguments['description'],
        ), rName: url);
      default:
        return _GeneratePage(widget: Container(), rName: url);
    }
  }
}

class _GeneratePage extends PageRouteBuilder {
  final Widget widget;
  final String rName;

  _GeneratePage({required this.widget, required this.rName})
      : super(
          settings: RouteSettings(name: rName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              textDirection: TextDirection.rtl,
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
