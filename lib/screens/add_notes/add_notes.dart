import 'package:flutter/material.dart';
import 'package:sqflite_practice/database/database_handler.dart';
import 'package:sqflite_practice/widget/textButton_widget.dart';
import 'package:sqflite_practice/widget/text_widget.dart';

import '../../model/notes_model.dart';
import '../../widget/textfield_widget.dart';

class AddNotes extends StatelessWidget {
  AddNotes({Key? key}) : super(key: key);

  DBHelper? dbHelper = DBHelper();
  TextEditingController notesTitle = TextEditingController();
  TextEditingController notesDescripition = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(titile: 'Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              titile: 'Add Notes',
              textColor: Colors.black54,
              textSize: 30.0,
              textFontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFieldWidget(
              hintText: 'Notes Title',
              controller: notesTitle,
            ),
            const SizedBox(
              height: 6.0,
            ),
            TextFieldWidget(
              hintText: 'Notes Description',
              controller: notesDescripition,
            ),
            const SizedBox(
              height: 10.0,
            ),
            // TextFieldWidget(),
            TextButtonWidget(
              title: 'Add Notes',
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              elevation: 14.0,
              textSize: 22.0,
              pressed: () {
                print(notesTitle.text.toString());
                print(notesDescripition.text);
                dbHelper!
                    .insert(
                  NotesModel(age: 21, email: "Shahab57@gmail.com", description: "descripition", title: "first titile"),
                )
                    .then((value) {
                  print('data added ');
                }).onError((error, stackTrace) {
                  print(stackTrace);
                  print(error.toString());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
