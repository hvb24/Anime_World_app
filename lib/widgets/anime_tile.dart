import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/models/anime_node.dart';
import '../screens/anime_detail_screen.dart';

class AnimeTile extends StatelessWidget {
  const AnimeTile({
    super.key,
    required this.anime,
  });

  final AnimeNode anime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => AnimeDetailsScreen(id: anime.id)),
        );
      },
      splashColor: Colors.white,
      child: SizedBox(
        width: 150,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Anime Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: anime.mainPicture.medium,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            const SizedBox(height: 10),
            // Anime Name
            Text(
              anime.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
