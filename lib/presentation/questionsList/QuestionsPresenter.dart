
import 'package:flutter_exam/model/Questions.dart';
import 'package:flutter_exam/presentation/questionsList/QuestionsView.dart';
import 'package:flutter_exam/repository/ApisRepository.dart';

class QuestionsPresenter {
  QuestionsView _view;

  QuestionsPresenter(this._view);

  fetchData({ApisRepository apisRepository = const ApisRepository()}) async {

    try {
      _view.changeLoading(true);
      List<Questions> questionList = await apisRepository.getData();
      _view.setQuestion(questionList);
    } catch (e) {
      print("ERROR ---------------------- "+ e.toString());
      _view.showError();
    } finally {
      _view.changeLoading(false);
    }
  }

  elementClicked(int position) {
    _view.openDetailScreen(position);
  }
}

