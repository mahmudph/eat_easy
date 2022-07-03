/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderActionWidget extends StatefulWidget {
  final Product product;
  const OrderActionWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<OrderActionWidget> createState() => _OrderActionWidgetState();
}

class _OrderActionWidgetState extends State<OrderActionWidget> {
  int numOfOrder = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppStorage>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _toggleAction(provider),
          const SizedBox(
            width: 20,
          ),
          _orderPrice(provider),
        ],
      ),
    );
  }

  Widget _orderPrice(AppStorage provider) {
    return InkWell(
      onTap: () async {
        Navigator.pop(context);

        provider.orderProduct(
          widget.product.id,
          numOfOrder,
        );
        context.showLoading(const Duration(seconds: 1));
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.6,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff615793),
        ),
        child: Selector<AppStorage, double>(
          selector: (_, state) => state.getPriceById(widget.product.id),
          builder: (_, state, __) {
            return Text(
              "Order Price \$${((widget.product.productPrice * numOfOrder) + state).toStringAsFixed(2)}",
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _toggleAction(AppStorage provider) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffF6F6F9),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                if (numOfOrder > 1) {
                  setState(() => numOfOrder -= 1);
                }
              },
              child: const Icon(
                Icons.remove,
                color: Color(0xff8E8EA9),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() => numOfOrder += 1);
              },
              child: const Icon(
                Icons.add,
                color: Color(0xff8E8EA9),
              ),
            )
          ],
        ),
      ),
    );
  }
}
