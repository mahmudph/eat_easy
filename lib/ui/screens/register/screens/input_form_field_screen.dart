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

class RegisterInputFormFieldScreen extends StatefulWidget {
  const RegisterInputFormFieldScreen({Key? key}) : super(key: key);

  @override
  State<RegisterInputFormFieldScreen> createState() =>
      _RegisterInputFormFieldScreenState();
}

class _RegisterInputFormFieldScreenState
    extends State<RegisterInputFormFieldScreen> {
  /// form state for input form field
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  /// controller for input form field
  late TextEditingController name, mobilePhone, password, passwordConfirmation;

  late ValueNotifier<bool> obscurePasswordText;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    mobilePhone = TextEditingController();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
    obscurePasswordText = ValueNotifier(true);
  }

  void _handleOnClickNextButton() async {
    /// we need validate this field first
    if (_formState.currentState?.validate() == true) {
      debugPrint("do something when email is valid");
      // mock as proccess request with loading
      await context.showLoading(const Duration(seconds: 3));

      var provider = Provider.of<AppStorage>(context, listen: false);

      provider.setUser(name.text, isUserName: true);
      provider.setUser(mobilePhone.text, isUserMobilePhone: true);
      provider.setUser(password.text, isUserPassword: true);

      /// navigate when email is valid and send the email to the next screen
      /// navigate to the next screen
      Navigator.pushNamed(context, Routes.registerVeirfyOtp);
      return;
    }

    context.showToast(
      false,
      message: "Please enter all field with valid data",
    );
  }

  @override
  void dispose() {
    name.dispose();
    mobilePhone.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    obscurePasswordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SizedBox(
          height: size.height,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _headerContentWidget(context, size),
                      _contentButtonWidget(context, size),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerContentWidget(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeaderNavWidget(),
          const HeaderCaptionWidget(
            title: "Getting started! ✌️",
            subTitle:
                "Look like you are new to us! Create an account for a complete experience.",
          ),
          Form(
            key: _formState,
            child: Column(
              children: [
                FormFieldWidget(
                  controller: name,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  hintText: 'Name',
                  validator: (e) =>
                      e!.isEmpty ? "Please enter a valid name" : null,
                ),
                FormFieldWidget(
                  controller: mobilePhone,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  hintText: 'Mobile Phone',
                  maxLength: 12,
                  validator: (e) {
                    if (e == null || e.isEmpty) {
                      return "Please enter a valid mobile phone";
                    }
                    if (!e.startsWith("08") && !e.startsWith("62")) {
                      return "mobile phone must start with 08 or 62";
                    }
                    if (e.length != 12) {
                      return "mobile phone must be 12 digits";
                    }
                    return null;
                  },
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: obscurePasswordText,
                  builder: (_, state, __) {
                    return Column(
                      children: [
                        FormFieldWidget(
                          controller: password,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          hintText: 'Password',
                          obscureText: state,
                          showObscureToggle: false,
                          validator: (e) {
                            if (e == null || e.isEmpty) {
                              return "Please enter a valid password";
                            } else if (e.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        FormFieldWidget(
                          controller: passwordConfirmation,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onPressSufixobscureTextIcon: () {
                            obscurePasswordText.value =
                                !obscurePasswordText.value;
                          },
                          obscureText: state,
                          showObscureToggle: true,
                          hintText: 'Password Confirmation',
                          validator: (e) {
                            if (e == null || e.isEmpty) {
                              return "Please enter a valid password";
                            }
                            if (e != password.text) {
                              return "Password and Password Confirmation must be same";
                            }
                            return null;
                          },
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentButtonWidget(BuildContext context, Size size) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ButtonWidget(
          onPress: _handleOnClickNextButton,
          title: "Next",
          buttonColor: const Color(0xff615793),
          titleColor: Colors.white,
        ),
      ),
    );
  }
}
