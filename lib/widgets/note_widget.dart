import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database_sql/constants.dart';
import 'package:flutter_database_sql/models/note.dart';
import 'package:flutter_database_sql/providers/dbhelper.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback delete;

  NoteWidget(this.note, this.delete);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () async {
        await DBHelper.deleteNote(note.id);
        delete();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.2),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(note.title, style: kNoteTitleTextStyle),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  note.content,
                  style: kNoteContentTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
