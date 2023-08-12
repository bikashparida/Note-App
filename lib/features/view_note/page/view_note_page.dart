import 'package:flutter/material.dart';
import 'package:notes_app/config/theme/theme.dart';

class ViewNotePage extends StatefulWidget {
  final String title;
  final String description;
  const ViewNotePage(
      {super.key, required this.title, required this.description});

  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        backgroundColor: CustomTheme.appColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: CustomTheme.white,
          ),
        ),
        title: const Text(
          'DETAILS',
          softWrap: false,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: CustomTheme.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'TITLE :',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.purple),
                  ),
                ),
                Text(
                  widget.title,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Description :',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.purple),
                  ),
                ),
                Text(
                  widget.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
