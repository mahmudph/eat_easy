/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';
import 'clip_item_widget.dart';

class QuestionAnswerWidget extends StatefulWidget {
  final ValueNotifier<List<UserQuestionAnswer>> userAnswer;
  final List<String> answerOptionsList;
  final void Function(List<String> id)? onSelectAnswer;
  final String question, stepId;
  final String hint;

  const QuestionAnswerWidget({
    Key? key,
    required this.question,
    required this.stepId,
    required this.userAnswer,
    required this.answerOptionsList,
    this.onSelectAnswer,
    this.hint = "Select all that applies: ",
  }) : super(key: key);

  @override
  State<QuestionAnswerWidget> createState() => _QuestionAnswerWidgetState();
}

class _QuestionAnswerWidgetState extends State<QuestionAnswerWidget> {
  late ValueNotifier<List<String>> userAnswerList;

  @override
  void initState() {
    super.initState();
    handleOnInitialState();
  }

  void handleOnInitialState() {
    UserQuestionAnswer? getUserAnswerList;
    try {
      getUserAnswerList = widget.userAnswer.value.singleWhere(
        (element) => element.questionId == widget.stepId,
      );
    } catch (_) {
      debugPrint("users answers is empty");
    } finally {
      userAnswerList = ValueNotifier<List<String>>(
        getUserAnswerList?.questionAnswer ?? [],
      );
    }
  }

  @override
  void dispose() {
    userAnswerList.dispose();
    super.dispose();
  }

  void handleOnTap(String value) {
    List<String> newAnswerList = userAnswerList.value;
    if (newAnswerList.contains(value)) {
      newAnswerList.remove(value);
    } else {
      newAnswerList.add(value);
    }

    if (widget.onSelectAnswer != null) {
      widget.onSelectAnswer!(newAnswerList);
    }

    userAnswerList.value = List.from(newAnswerList);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._questionContentWidget(context, size),
        ..._questionAnswerContentWidget(context, size),
      ],
    );
  }

  List<Widget> _questionAnswerContentWidget(BuildContext context, Size size) {
    return [
      Expanded(
        child: ValueListenableBuilder<List<String>>(
          valueListenable: userAnswerList,
          builder: (_, value, __) {
            return Wrap(
              children: [
                ...widget.answerOptionsList.map((answer) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipItemWidget(
                      title: answer,
                      backgroundColor: const Color(0xffF5F5F5),
                      isActiveBackgroundColor: const Color(0xffFFB01D),
                      isActiveTextColor: Colors.white,
                      textColor: Colors.black,
                      isActive: userAnswerList.value.contains(answer),
                      onTap: () => handleOnTap(answer),
                    ),
                  );
                }).toList()
              ],
            );
          },
        ),
      ),
    ];
  }

  List<Widget> _questionContentWidget(BuildContext context, Size size) {
    return [
      Text(
        widget.question,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 22,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w500,
          color: Color(0xff8E8EA9),
        ),
      ),
      const SizedBox(
        height: 14,
      ),
      Text(
        widget.hint,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "Mulish",
          fontWeight: FontWeight.w500,
          color: Color(0xff8E8EA9),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
    ];
  }
}
