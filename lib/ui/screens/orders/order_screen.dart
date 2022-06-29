/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/models/user_order.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var prov = Provider.of<AppStorage>(context, listen: false);
    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  const HeaderNavWidget(
                    withNavMenu: true,
                    withBackButton: true,
                    title: "Order List",
                  ),
                  Expanded(
                    child: Selector<AppStorage, List<UserOrder>>(
                      selector: (_, state) => state.userOrder,
                      builder: (_, state, __) {
                        if (state.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: HeaderCaptionWidget(
                              title: "Order is empty",
                              subTitle:
                                  "No Order found, you can add product in the dasboard",
                            ),
                          );
                        }
                        return ListView.separated(
                          separatorBuilder: (_, i) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: state.length,
                          itemBuilder: (_, i) {
                            return ListItemProductWidget(
                              onPress: (e) {},
                              product: state[i].product,
                              price: state[i].totalPrice,
                              withCountingNumItem: true,
                              numOfOrder: state[i].numOfOrder,
                              onPressAdd: () {
                                prov.updateOrder(state[i].id);
                              },
                              onPressRemove: () {
                                prov.updateOrder(state[i].id, false);
                              },
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
