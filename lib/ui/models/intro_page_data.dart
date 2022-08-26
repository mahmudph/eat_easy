/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

class IntroPageData {
  final String title;
  final String description;
  final String image;

  IntroPageData({
    required this.title,
    required this.image,
    required this.description,
  });
}

List<IntroPageData> introPage = [
  IntroPageData(
    title: "Full contactless experience",
    description: "From ordering to paying, that's all contactless",
    image: 'lib/assets/images/Ilustration.png',
  ),
  IntroPageData(
    title: "Help by smart assisten",
    description: "From ordering to paying, that's all contactless",
    image: 'lib/assets/images/Ilustration2.png',
  ),
];
