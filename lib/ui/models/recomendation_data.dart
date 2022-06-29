/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

class RecomendationData {
  final String title;
  final String? date;
  RecomendationData({
    required this.title,
    this.date,
  });
}

List<RecomendationData> recomendationn = [
  RecomendationData(
    title: "New recommendation",
  ),
  RecomendationData(
    title: "New recommendation",
    date: "02/12/2020",
  ),
];
