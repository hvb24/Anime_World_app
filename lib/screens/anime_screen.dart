import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/featured_animes.dart';
import '../widgets/top_anime_widgets.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime World'),
        // actions: [
        //   IconButton(onPressed: (){},
        //       icon: Icon(Icons.search))
        // ],
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [

            SizedBox(
              height: 300,
              child: TopAnimesList(),
            ),
            SizedBox(
              height: 350,
              child: FeaturedAnimes(rankingType: 'all', label: 'Top Ranked',),
            )

          ],
        ),
      ),
    );
  }
}
