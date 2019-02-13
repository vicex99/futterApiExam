import 'package:flutter/material.dart';
import 'package:flutter_exam/model/Questions.dart';

class QuestionDetailSreen extends StatefulWidget {
  final Questions _question;
  QuestionDetailSreen(this._question, {Key key} ) : super(key: key);

  @override
  _QuestionDetailSreenState createState() => _QuestionDetailSreenState();
}

class _QuestionDetailSreenState extends State<QuestionDetailSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text ( widget._question.textQuestion, textScaleFactor: 1.3,),
              RaisedButton(
                color: Colors.white,
                elevation: 0,
                child: Text(widget._question.correctAnswers, textScaleFactor: 1.05,), onPressed: () {},
              ),
              RaisedButton(
                color: Colors.white,
                elevation: 0,
                child:  Text(widget._question.wrongAnswers[0], textScaleFactor: 1.05,), onPressed: () {},
              ),
              RaisedButton(
                color: Colors.white,
                elevation: 0,
                child: Text(widget._question.wrongAnswers[1], textScaleFactor: 1.05,), onPressed: () {},
              ),
              RaisedButton(
                color: Colors.white,
                elevation: 0,
                child:  Text(widget._question.wrongAnswers[2], textScaleFactor: 1.05,), onPressed: () {},
              ),

            ],
          ),
        )
    );
  }
}
