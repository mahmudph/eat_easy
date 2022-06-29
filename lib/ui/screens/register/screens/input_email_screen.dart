/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterInputEmail extends StatefulWidget {
  const RegisterInputEmail({Key? key}) : super(key: key);

  @override
  State<RegisterInputEmail> createState() => _RegisterInputEmailState();
}

class _RegisterInputEmailState extends State<RegisterInputEmail> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _email;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _handleOnClickNextButton() async {
    /// we need validate this field first
    if (_formState.currentState?.validate() == true) {
      debugPrint("do something when email is valid");
      debugPrint(_email.text);

      // mock as proccess request with loading
      await context.showLoading(const Duration(seconds: 3));

      var provider = Provider.of<AppStorage>(context, listen: false);

      provider.setUser(_email.text, isUserEmail: true);

      /// navigate when email is valid and send the email to the next screen
      /// navigate to the next screen
      Navigator.pushNamed(context, Routes.registerInputField);
      return;
    }

    context.showToast(
      false,
      message: "Please enter a valid email address",
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _headerContentWidget(context, size),
                  _bottomFotterContent(context, size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerContentWidget(BuildContext context, Size size) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeaderNavWidget(),
          const HeaderCaptionWidget(
            title: "What's your email? 📨",
            subTitle:
                "We need it to search after your account or create a new one",
          ),
          Form(
            key: _formState,
            child: FormFieldWidget(
              controller: _email,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              hintText: 'Email',
              validator: (e) {
                var regex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                );
                if (e == null || e.isEmpty || !regex.hasMatch(e)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomFotterContent(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: ButtonWidget(
        onPress: _handleOnClickNextButton,
        title: "Next",
        buttonColor: const Color(0xff615793),
        titleColor: Colors.white,
      ),
    );
  }
}
