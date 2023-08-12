import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/config/routes/route_generator.dart';
import 'package:notes_app/config/routes/route_names.dart';
import 'package:notes_app/config/theme/theme.dart';
import 'package:notes_app/features/notes_list/page/notes_listing_page.dart';
import 'package:notes_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomTheme.seedColor,
        ).copyWith(
          background: CustomTheme.appColor,
        ),
      ),
      home: const NotesListingPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteNames.notesListingPageRoute,
    );
  }
}
