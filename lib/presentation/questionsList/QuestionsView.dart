import 'package:flutter_exam/model/Questions.dart';

abstract class QuestionsView {
  openDetailScreen(int position);

  setQuestion(List<Questions> question);

  changeLoading(bool state);

  showError();
}