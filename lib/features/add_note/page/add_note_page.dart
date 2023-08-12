import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/config/theme/theme.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/data/repository/notes_repository.dart';
import 'package:notes_app/features/add_note/bloc/add_note_bloc.dart';
import 'package:notes_app/features/add_note/widget/custom_textform_field.dart';
import 'package:notes_app/features/notes_list/widgets/my_ink_well.dart';
import 'package:notes_app/helpers/custom_snack_bar.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late GlobalKey<FormState> _formKey;

  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteBloc(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(),
          backgroundColor: CustomTheme.appColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: CustomTheme.white,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'ADD NOTE',
            softWrap: false,
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: CustomTheme.white,
        body: BlocConsumer<AddNoteBloc, AddNoteState>(
          listener: (context, state) {
            if (state is AddingNoteSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context: context,
                  title: 'ADDED',
                  message: 'Your note has been successfully added.',
                ),
              );
            }
            if (state is AddingNoteError) {
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
            if (state is AddingNoteLoad) {
              return Center(
                child: CircularProgressIndicator(
                  color: CustomTheme.purple,
                ),
              );
            }
            if (state is AddingNoteError) {
              return Center(
                child: Text(
                  'Unable to add the note!, please try again!',
                  style: CustomTheme.labelRegular,
                ),
              );
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CustomTextFormField(
                              label: 'Title',
                              focusNode: focusNode,
                              controller: _titleController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().isEmpty) {
                                  return 'Please enter the title..';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            CustomTextFormField(
                              label: 'Description',
                              controller: _descriptionController,
                              keyboardType: TextInputType.text,
                              maxLines: 15,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().isEmpty) {
                                  return 'Please enter the description..';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 220,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: MyInkWell(
                              builder: (hover) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (!(_formKey.currentState!.validate())) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        customSnackBar(
                                          context: context,
                                          title: 'INVALID',
                                          message:
                                              'Please fill the details properly.',
                                          color: Colors.red,
                                        ),
                                      );
                                      return;
                                    }
                                    context.read<AddNoteBloc>().add(
                                          AddingNote(
                                            noteModel: NoteModel(
                                              title: _titleController.text,
                                              description:
                                                  _descriptionController.text,
                                            ),
                                          ),
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: hover
                                          ? CustomTheme.purple
                                          : CustomTheme.white),
                                  child: Text(
                                    'Add Note',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          hover ? Colors.white : Colors.purple,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
