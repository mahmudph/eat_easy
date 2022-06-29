/*
* Created by mahmud on Sat Jun 25 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/
import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/extensions/list_product_extensions.dart';
import 'package:eat_easy_app/logic/app_storage.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/conten_home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<String> tabs = ['Eat', 'Drink', 'Disert'];
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffFCFCFC),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Selector<AppStorage, String?>(
                    selector: (_, state) => state.userData?.userName,
                    builder: (_, state, __) {
                      return HeaderNavWidget(
                        withNavMenu: true,
                        withBackButton: false,
                        leftIcon: Icons.pin_drop_sharp,
                        title: state ?? "Easy shoop",
                        onPressLeftIcon: () {},
                        onPressRightIcon: () {
                          context.showBottomSheetMenu(
                            Container(
                              height: 120,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 20,
                              ),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "My Order",
                                    style: TextStyle(
                                      fontFamily: "DM Sans",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff32324D),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.popAndPushNamed(
                                        context,
                                        Routes.order,
                                      );
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "We think you might enjoy these specially selected dishes",
                      style: TextStyle(
                        fontFamily: "DM Sans",
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff32324D),
                      ),
                    ),
                  ),
                  tabBarContent(context, size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabBarContent(BuildContext context, Size size) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      height: size.height * 0.80,
      child: Column(
        children: [
          tabBarWidgetContant(context, size),
          tabBarView(context, size)
        ],
      ),
    );
  }

  Widget tabBarView(BuildContext context, Size size) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          ContenHomeTab(
            item: productList.getEatProduct,
          ),
          ContenHomeTab(
            item: productList.getDrinkProduct,
          ),
          ContenHomeTab(
            item: productList.getDisertProduct,
          ),
        ],
      ),
    );
  }

  Widget tabBarWidgetContant(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: size.width * 0.7,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              enableFeedback: false,
              unselectedLabelColor: const Color(0xff8E8EA9),
              indicatorColor: const Color(0xffFFB01D),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffFFB01D),
              ),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w500,
              ),
              tabs: tabs
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList(),
            ),
          ),
          const Spacer(),
          const SizedBox(
            height: 30,
            child: VerticalDivider(
              color: Color(0xff8E8EA9),
            ),
          ),
          const Spacer(),
          ButtonIconWidget(
            icon: Icons.menu,
            iconColor: const Color(0xff32324D),
            color: Colors.white,
            onPress: () {},
          )
        ],
      ),
    );
  }
}
