import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/routes/route_names.dart';
import 'package:notes_app/config/theme/theme.dart';
import 'package:notes_app/features/notes_list/bloc/notes_bloc.dart';
import 'package:notes_app/helpers/custom_snack_bar.dart';

class NotesListingPage extends StatefulWidget {
  const NotesListingPage({super.key});

  @override
  State<NotesListingPage> createState() => _NotesListingPageState();
}

class _NotesListingPageState extends State<NotesListingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc()..add(const GetNotes()),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(),
          backgroundColor: CustomTheme.appColor.withOpacity(0.5),
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          centerTitle: true,
          title: const Text(
            'MY NOTES',
            softWrap: false,
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocConsumer<NotesBloc, NotesState>(
          listener: (context, state) {
            if (state is NotesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context: context,
                  title: 'ERROR',
                  message: 'Unable to add the Note.',
                  color: Colors.deepOrange,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is NotesLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: CustomTheme.purple,
                ),
              );
            }
            if (state is NotesError) {
              return Center(
                child: Text(
                  'Unable to load! Please check your internet connection or try again later.',
                  style: CustomTheme.labelRegular,
                ),
              );
            }
            if (state is NotesLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.notesList.length,
                    itemBuilder: (context, index) {
                      var note = state.notesList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RouteNames.viewNotePageRoute,
                            arguments: {
                              'title': note.title,
                              'description': note.description,
                            },
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7.0),
                                child: Center(
                                  child: Text(
                                    note.title,
                                    style: TextStyle(
                                        color: CustomTheme.appColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Divider(
                                  color: CustomTheme.purple,
                                  thickness: 2,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  note.description,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: CustomTheme.darkGray,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            return FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RouteNames.addNotePageRoute)
                    .then(
                      (value) => context.read<NotesBloc>()
                        ..add(
                          const GetNotes(),
                        ),
                    );
              },
            );
          },
        ),
      ),
    );
  }
}
