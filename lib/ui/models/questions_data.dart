/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:uuid/uuid.dart';

class QuestionsData {
  final String stepId;
  final String questions;
  final String questionHint;
  final List<String> answerOptions;

  QuestionsData({
    required this.stepId,
    required this.questionHint,
    required this.questions,
    required this.answerOptions,
  });
}

class UserQuestionAnswer {
  String questionId;
  List<String> questionAnswer;

  UserQuestionAnswer({
    required this.questionId,
    required this.questionAnswer,
  });

  UserQuestionAnswer copyWith({
    String? questionId,
    List<String>? questionAnswer,
  }) {
    return UserQuestionAnswer(
      questionId: questionId ?? this.questionId,
      questionAnswer: questionAnswer ?? this.questionAnswer,
    );
  }
}

/// list of the questions
final List<QuestionsData> questionsData = [
  QuestionsData(
    stepId: const Uuid().v4(),
    questions: 'How are you feeling right now?',
    questionHint: "Select all that applies: ",
    answerOptions: [
      'π₯΅ Thirtsy',
      'π€€ Hungry',
      'π₯± Tired',
      'π‘ Angry',
      'π€¨ Bored',
      'πͺ Sick',
      'π₯΅ Energized',
      'π₯΅ Other'
    ],
  ),
  QuestionsData(
    stepId: const Uuid().v4(),
    questions: 'What type of snack do you like?',
    questionHint: "Select all that applies: ",
    answerOptions: [
      'π₯¨Potatos',
      'π Hamburgers',
      'π French fries',
      'π Pidza',
    ],
  ),
  QuestionsData(
    stepId: const Uuid().v4(),
    questions: 'What type of foods do you like?',
    questionHint: "Select all that applies: ",
    answerOptions: [
      'π§ Seafood',
      'π chicken',
      'π₯ Vegetarian',
    ],
  ),
];
