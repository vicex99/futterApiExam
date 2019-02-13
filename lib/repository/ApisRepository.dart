import 'dart:convert';

import 'package:flutter_exam/model/Questions.dart';

// package for get data in api
import 'package:http/http.dart' as network;

class ApisRepository {

  const ApisRepository();

  Future<List<Questions>> getData() async {
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    final jsonBody = json.decode(response.body);
    if (jsonBody['response_code'] == 0) {

      List<Questions> questions = jsonBody['results'].map<Questions>((element) {
        String name = element['question'];
        String correct = element['correct_answer'];
        List<String> incorrects = [];

        for( var item in element['incorrect_answers']){
          incorrects.add(item);
        }

        return Questions(name, correct, incorrects);
      }).toList();
      return questions;
    } else {
      throw Exception('Error fetching users');
    }
  }
}
