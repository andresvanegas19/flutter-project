import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          // ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            side: BorderSide(
              width: 10,
            ),
          ),

          child: Text(answerText),
          onPressed: selectHandler,
        ));
  }
}
