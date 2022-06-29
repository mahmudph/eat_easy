/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterVerifyOtpScreen extends StatefulWidget {
  const RegisterVerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<RegisterVerifyOtpScreen> createState() =>
      RegisterVerifyOtpScreenState();
}

class RegisterVerifyOtpScreenState extends State<RegisterVerifyOtpScreen> {
  final List<TextEditingController> _listFields = [];
  final List<FocusNode> _listFocusScope = [];

  /// max of the field otp
  final int maxField = 4;

  // temp otp code
  List<String?> _myVars = [];

  @override
  void initState() {
    super.initState();

    _myVars = List.filled(maxField, null);
    for (int i = 0; i < maxField; i++) {
      // create text editing controller
      var controller = TextEditingController();

      // add to the list
      _listFields.add(controller);

      // add to the list
      _listFocusScope.add(FocusNode());

      controller.addListener(() => _onChangeText(i));
    }
  }

  void _onChangeText(int i) {
    String value = _listFields[i].text;
    if (_myVars[i] == value) return;

    _myVars[i] = value;

    if (value.isEmpty) {
      if (i - 1 >= 0) {
        FocusScope.of(context).requestFocus(_listFocusScope[i - 1]);
      }
      return;
    }

    // request focus for the next form"
    if (i + 1 < maxField) {
      FocusScope.of(context).requestFocus(_listFocusScope[i + 1]);
    } else if (_myVars.length - 1 == i) {
      FocusScope.of(context).unfocus();
    }
  }

  void onResendCode() {
    /// reset the otp code
    _myVars = List.filled(maxField, null);

    /// reset the text field
    for (var item in _listFields) {
      item.clear();
    }

    context.showToast(
      true,
      message: "Success to resend the code",
    );

    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(_listFocusScope[0]);
  }

  @override
  void dispose() {
    for (var item in _listFields) {
      item.dispose();
    }
    super.dispose();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerContentWidget(context, size),
                  _contentButtonWidget(context, size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerContentWidget(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeaderNavWidget(),
          const HeaderCaptionWidget(
            title: "Verify Code ⚡️",
            subTitle:
                "We just sent a 4-digit verification code to robert.fox@gmail.com. Enter the code in the box below to continue.",
          ),
          _otpFieldContenWidget(context, size),
          _resentOtpCodeWidget(context, size),
        ],
      ),
    );
  }

  Widget _resentOtpCodeWidget(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: RichText(
        text: TextSpan(
          text: "Didn't receive a code? ",
          style: const TextStyle(
            color: Color(0xff8E8EA9),
            fontSize: 16,
            fontFamily: "Mulish",
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onResendCode,
              text: "Resend Code",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Mulish",
                color: Color(0xffFFB01D),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _otpFieldContenWidget(
    BuildContext context,
    Size size,
  ) {
    List<Widget> listWidget = [];

    for (var i = 0; i < _listFields.length; i++) {
      listWidget.add(
        OtpFormFieldWidget(
          controller: _listFields[i],
          focusScope: _listFocusScope[i],
          isLastField: i == _listFields.length - 1,
        ),
      );
      if (i != _listFields.length - 1) {
        listWidget.add(
          const SizedBox(
            width: 15,
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: listWidget,
    );
  }

  Widget _contentButtonWidget(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: ButtonWidget(
        onPress: () {
          var otp = _myVars.join("");
          if (otp.length != 4) {
            context.showToast(
              false,
              message: "Please enter 4 digit code otp",
            );
            return;
          }
          Navigator.pushNamed(context, Routes.registerSetLocation);
        },
        title: "Next",
        buttonColor: const Color(0xff615793),
        titleColor: Colors.white,
      ),
    );
  }
}
