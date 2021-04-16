import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmind_task/model/questionModel.dart';
import 'package:flutter/foundation.dart';

class QuizProvider with ChangeNotifier {
  List<QuestionModel> questions = [];

  Future<void> loadProducts() async {
    final fireStore = FirebaseFirestore.instance;
    await fireStore
        .collection('Quiz')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        List<String> ans = [];
        String q;
        String c;
        element.data().forEach((key, value) {
          if (key == "Q") {
            q = value;
          } else if (key == "Correct") {
            c = value;
          } else {
            ans.add(value);
          }
        });
        var newQuestion =
            new QuestionModel(question: q, options: ans, correct: c);
        questions.add(newQuestion);
      });
    });
    print(questions);
  }
}
