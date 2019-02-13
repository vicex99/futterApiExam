import 'package:flutter/material.dart';
import 'package:flutter_exam/model/Questions.dart';
import 'package:flutter_exam/presentation/questionDetail/QuestionDetailSreen.dart';
import 'package:flutter_exam/presentation/questionsList/QuestionsPresenter.dart';
import 'package:flutter_exam/presentation/questionsList/QuestionsView.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> implements QuestionsView {

  QuestionsPresenter _questionsPresenter;
  List<Questions> _questions = [];
  bool _isLoading = true;
  bool _isError = false;

  _QuestionsScreenState() {
    _questionsPresenter = QuestionsPresenter(this);
  }


  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: CircularProgressIndicator(),
          ));
    }
     if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _questionsPresenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.question_answer),
              title:
              Text(_questions[position].textQuestion),
              onTap: () {
                _questionsPresenter.elementClicked(position);
              },
            );
          },
          itemCount: _questions.length,
          reverse: false,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _questionsPresenter.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(),
    );
  }

  @override
  changeLoading(state) {
    setState(() {
      _isLoading = state;
    });
  }


  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  setQuestion(List<Questions> question) {
    setState(() {
      this._questions = question;
    });
  }

  @override
  openDetailScreen(int position) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return QuestionDetailSreen(_questions[position]); //SettingsScreen(position);
    }));
  }

}
