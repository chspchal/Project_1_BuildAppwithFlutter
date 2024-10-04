import 'package:build_app/constants/constant.dart';
import 'package:build_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:build_app/screens/main_page/song_player.dart'; // Import your SongPlayer class

class Songs extends StatelessWidget {
  const Songs({super.key});

  @override
  Widget build(BuildContext context) {
    void _navigateToSongPlayer(int index) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPlayer(songIndex: index), // Pass the song index
        ),
      );
    }

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _navigateToSongPlayer(index), // Navigate on tap
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(songImagePaths[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 130,
                child: Text(
                  songTitlePaths[index], // Dynamically load song title
                  style: TitleText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 130,
                child: Text(
                  artistNamePaths[index], // Dynamically load artist name
                  style: SubText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemCount: songImagePaths.length, // Item count based on image list length
    );
  }
}

class Artist extends StatelessWidget {
  const Artist({super.key});

  @override
  Widget build(BuildContext context) {
    // List of artist images
    


    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(artistImagePaths[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                favoriteArtistNamePaths[index], // Dynamically load artist name
                style: TitleText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemCount: favoriteArtistNamePaths.length, // Item count based on image list length
    );
  }
}
