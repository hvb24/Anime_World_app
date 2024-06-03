import 'package:anime_world/core/screens/error_screen.dart';
import 'package:anime_world/widgets/top_animes_image_slider.dart';
import 'package:flutter/material.dart';

import '/api/get_anime_by_ranking_type_api.dart';
import '/core/widgets/loader.dart';


class TopAnimesList extends StatelessWidget {
  const TopAnimesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingTypeApi(rankingType: 'all', limit: 5 ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.hasData) {
          // print(snapshot.data);
          final animes = snapshot.data!;
          return TopAnimeImageSlider(
            animes: animes,
          );
        }

        return ErrorScreen(
           error: snapshot.error.toString(),
        );
      },
    );
  }
}