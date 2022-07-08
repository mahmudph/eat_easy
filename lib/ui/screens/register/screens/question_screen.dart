/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:eat_easy_app/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterQuestionScreen extends StatefulWidget {
  const RegisterQuestionScreen({Key? key}) : super(key: key);

  @override
  State<RegisterQuestionScreen> createState() => _RegisterQuestionScreenState();
}

class _RegisterQuestionScreenState extends State<RegisterQuestionScreen> {
  late int maxQuestionIndex;
  late ValueNotifier<int> currentIndex;
  late ValueNotifier<List<UserQuestionAnswer>> userQuestionAnswer;
  late PageController scrollController = PageController();

  @override
  void initState() {
    super.initState();
    maxQuestionIndex = questionsData.length;
    currentIndex = ValueNotifier<int>(0);
    userQuestionAnswer = ValueNotifier<List<UserQuestionAnswer>>([]);
  }

  @override
  void dispose() {
    currentIndex.dispose();
    userQuestionAnswer.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void handleOnUserAnswerList(String questionId, List<String> answerList) {
    List<UserQuestionAnswer> newUserQuestionAnswer = userQuestionAnswer.value;

    /// check if user question answer for spesific question id already exists
    bool isExists = false;
    for (var item in newUserQuestionAnswer) {
      if (item.questionId == questionId) {
        isExists = true;
        break;
      }
    }

    if (!isExists) {
      newUserQuestionAnswer.add(
        UserQuestionAnswer(
          questionId: questionId,
          questionAnswer: answerList,
        ),
      );

      userQuestionAnswer.value = List.from(newUserQuestionAnswer);
    } else {
      var data = newUserQuestionAnswer.map((element) {
        if (element.questionId == questionId) {
          return element.copyWith(
            questionAnswer: answerList,
          );
        }
        return element;
      }).toList();

      /// update data in state
      userQuestionAnswer.value = List.from(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerNavigationWidget(context, size),
                  _contentDataWidget(context, size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentDataWidget(BuildContext context, Size size) {
    return SizedBox(
      height: size.height * 0.88,
      width: double.infinity,
      child: Stack(
        children: [
          _contentWidget(context, size),
          _contentIndicatorWidget(context, size),
          _bottomWidgetContent(context, size)
        ],
      ),
    );
  }

  Widget _contentWidget(BuildContext context, Size size) {
    return Positioned(
      top: 50,
      left: 0,
      right: 0,
      child: SizedBox(
        width: double.infinity,
        height: size.height,
        child: PageView.builder(
          controller: scrollController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questionsData.length,
          onPageChanged: (i) {
            currentIndex.value = i;
          },
          itemBuilder: (_, i) {
            return QuestionAnswerWidget(
              question: questionsData[i].questions,
              answerOptionsList: questionsData[i].answerOptions,
              hint: questionsData[i].questionHint,
              stepId: questionsData[i].stepId,
              onSelectAnswer: (answer) {
                handleOnUserAnswerList(
                  questionsData[i].stepId,
                  answer,
                );
              },
              userAnswer: userQuestionAnswer,
            );
          },
        ),
      ),
    );
  }

  Widget _contentIndicatorWidget(BuildContext context, Size size) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: ValueListenableBuilder<int>(
        valueListenable: currentIndex,
        builder: (_, curIndex, __) {
          return IndicatorPageViewWidget(
            currentPage: curIndex,
            pageLength: maxQuestionIndex,
            width: size.width - 16,
          );
        },
      ),
    );
  }

  Widget _headerNavigationWidget(BuildContext context, Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonIconWidget(
              onPress: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (_, curIndex, __) {
                  return Text(
                    'Step ${curIndex + 1}/$maxQuestionIndex',
                    style: const TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 14,
                      color: Color(0xff8E8EA9),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Storage.instance.setSignUpLater();
                Navigator.pushNamed(context, Routes.home);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(left: 8),
              ),
              child: const Text(
                "Skip question",
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 14,
                  color: Color(0xff32324D),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomWidgetContent(BuildContext context, Size size) {
    var provider = Provider.of<AppStorage>(context, listen: false);
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          ButtonWidget(
            onPress: () {
              Navigator.pushNamed(
                context,
                Routes.registerVirtualAssis,
              );
            },
            title: "Take me to the menu",
            buttonColor: Colors.white,
            titleColor: const Color(0xff615793),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (_, curIndex, __) {
              return ButtonWidget(
                onPress: () {
                  if (currentIndex.value < maxQuestionIndex - 1) {
                    scrollController.jumpToPage(currentIndex.value + 1);
                    return;
                  }
                  context.showToast(
                    true,
                    message: "You have completed the questions",
                  );

                  provider.save();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.home,
                    (route) => false,
                  );
                },
                title: currentIndex.value < maxQuestionIndex - 1
                    ? "Continue"
                    : "Done",
                buttonColor: const Color(0xff615793),
                titleColor: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }
}
