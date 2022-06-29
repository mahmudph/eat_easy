/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/widgets/product_detail_conten_widget.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderProductMessageWidget extends StatefulWidget {
  final String productId;
  const OrderProductMessageWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<OrderProductMessageWidget> createState() =>
      _OrderProductMessageWidgetState();
}

class _OrderProductMessageWidgetState extends State<OrderProductMessageWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController message;

  @override
  void initState() {
    super.initState();
    message = TextEditingController();
    handleOnListenFormFieldMessage();
  }

  void handleOnListenFormFieldMessage() {
    var provider = Provider.of<AppStorage>(context, listen: false);
    message.addListener(() {
      provider.setPreOrderMessage(
        widget.productId,
        message.text,
      );
    });
  }

  @override
  void dispose() {
    message.removeListener(() {});
    message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: ProductDetailContenWidget(
        title: "Add a request",
        child: Form(
          key: _formKey,
          child: FormFieldWidget(
            controller: message,
            hintText: "Ex: Don't add onion",
            maxLines: 3,
            textInputAction: TextInputAction.done,
          ),
        ),
      ),
    );
  }
}
