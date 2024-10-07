import 'package:build_app/constants/constant.dart';
import 'package:build_app/data/data.dart';
// Make sure likedSongs is defined here
import 'package:build_app/screens/main_page/song_player.dart';
import 'package:flutter/material.dart';

class LikeSong extends StatefulWidget {
  const LikeSong({super.key});

  @override
  State<LikeSong> createState() => _LikeSongState();
}

class _LikeSongState extends State<LikeSong> {
  // Remove a song from the liked list
  void _unfavoriteSong(int index) {
    setState(() {
      likedSongs.removeAt(index); // Modify global likedSongs list
    });
  }

  @override
  Widget build(BuildContext context) {
    double oneThirdHeight = MediaQuery.of(context).size.height / 6;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 84, 0, 228),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // Header with gradient and song count
              Container(
                width: double.infinity,
                height: oneThirdHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 84, 0, 228), // Purple
                      const Color.fromARGB(255, 0, 0, 0), // Black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0), // Padding for some space around the text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically within the container
                    children: [
                      Text(
                        'Liked Songs',
                        style: Head,
                      ),
                      const SizedBox(height: 10), // Space between title and song count
                      Text(
                        '${likedSongs.length} songs', // Display dynamic song count
                        style: MenuText,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: likedSongs.length,
                  itemBuilder: (context, index) {
                    final songIndex = likedSongs[index];
                    return InkWell( // Wrap ListTile with InkWell for tap detection
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SongPlayer(songIndex: songIndex), // Navigate to SongPlayer
                          ),
                        );
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0), // Circular border radius
                          child: Image.asset(
                            songImagePaths[songIndex],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(songTitlePaths[songIndex], style: SongTitle),
                        subtitle: Text(artistNamePaths[songIndex], style: SongArtist),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red),
                          onPressed: () => _unfavoriteSong(index), // Unfavorite song
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
