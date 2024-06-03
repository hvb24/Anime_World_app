// import 'dart:js';

import 'package:flutter/material.dart';


import '../common/widgets/ios_back_button.dart';
import '../common/widgets/read_more_text.dart';
import '/api/get_anime_details_api.dart';



import '/core/screens/error_screen.dart';
import '/core/widgets/loader.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeDetailsApi(id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final anime = snapshot.data;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAnimeImage(
                    imageUrl: anime!.mainPicture.large,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 36.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      _buildAnimeName(englishName: anime.title, defaultName: anime.alternativeTitles.en),
                        const SizedBox(height: 20),

                        // Description
                        ReadMoreText(
                          longText: anime.synopsis,
                        ),

                        const SizedBox(height: 10),



                        const SizedBox(height: 20),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ErrorScreen(
          error: snapshot.error.toString(),
        );
      },
    );
  }

  Widget _buildAnimeImage({
    required String imageUrl,
  }) =>
      Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Builder(builder: (context) {
              return IosBackButton(
                onPressed: Navigator
                    .of(context)
                    .pop,
              );
            }),
          ),
        ],
      );

Widget _buildAnimeName({
  required String englishName,
  required String defaultName,
}) =>
    Builder(
      builder: (context) {
        return Text( englishName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),

        );
      }
    );


}