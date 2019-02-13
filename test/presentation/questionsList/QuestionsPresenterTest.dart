
import 'package:flutter_exam/model/Questions.dart';

import 'package:flutter_exam/repository/ApisRepository.dart';

import 'package:flutter_exam/presentation/questionsList/QuestionsView.dart';
import 'package:flutter_exam/presentation/questionsList/QuestionsPresenter.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';




class MockQuestionsView extends Mock implements QuestionsView {}

class MockQuestionsRepo extends Mock implements ApisRepository {}


void main() {
  final mockView = MockQuestionsView();
  final mockRepo = MockQuestionsRepo();
  final usersList = [
    Questions('Test', 'TestName', ['este', 'otro', 'aquel']),
  ];

  test('Fetch data should return list of users', () async {
    when(mockRepo.getData()).thenAnswer((_) => Future.value(usersList));

    QuestionsPresenter presenter = QuestionsPresenter(mockView);

    await presenter.fetchData(apisRepository: mockRepo);
    verify(mockView.changeLoading(true));
    verify(mockView.setQuestion(usersList));
    verify(mockView.changeLoading(false));
  });

  test('Fetch data should show error when fetch fails', () async {
    when(mockRepo.getData()).thenAnswer((_) => Future.error(Exception()));

    QuestionsPresenter presenter = QuestionsPresenter(mockView);

    await presenter.fetchData(apisRepository: mockRepo);
    verify(mockView.changeLoading(true));
    verify(mockView.showError());
    verify(mockView.changeLoading(false));
  });
}