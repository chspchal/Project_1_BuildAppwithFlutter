import 'package:build_app/constants/constant.dart';
import 'package:build_app/data/data.dart';
import 'package:build_app/screens/component/carousel.dart';
import 'package:build_app/screens/component/drawer.dart';
import 'package:build_app/screens/component/profile_image.dart';
import 'package:build_app/screens/component/song_box.dart';
import 'package:build_app/screens/main_page/song_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentGreetings = '';
  DateTime currentTime = DateTime.now();
  int? currentPlayingSongIndex; // Keep track of the currently playing song index

  @override
  void initState() {
    super.initState();
    _setGreetings();
  }

  // Set the greetings based on the current time
  void _setGreetings() {
    if (currentTime.hour < 12) {
      currentGreetings = 'Good Morning';
    } else if (currentTime.hour < 17) {
      currentGreetings = 'Good Afternoon';
    } else {
      currentGreetings = 'Good Evening';
    }
  }

  // Function to navigate to the song player and update the currently playing song
  void _navigateToSongPlayer(int songIndex) async {
    setState(() {
      currentPlayingSongIndex = songIndex; // Update the current playing song index
    });

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SongPlayer(songIndex: songIndex),
      ),
    );

    setState(() {}); // Refresh the page when returning from the player
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ProfileDrawer(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Header Section with Greetings and Profile Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        currentGreetings,
                        style: Head,
                      ),
                      const SizedBox(width: 50),
                      ProfileImage(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Song Boxes Section
                  Container(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(2, (index) {
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              3,
                              (songIndex) {
                                int actualIndex = songIndex + index * 3;

                                return GestureDetector(
                                  onTap: () => _navigateToSongPlayer(actualIndex),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SongBox(
                                        title: songTitlePaths[actualIndex],
                                        image: Image.asset(songImagePaths[actualIndex]),
                                      ),
                                      // Display play signal if this song is currently playing
                                      if (currentPlayingSongIndex == actualIndex)
                                        Positioned(
                                          right: 8,
                                          bottom: 8,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            // Carousel Sections
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 20),
              child: Column(
                children: const [
                  Carousel(title: 'Made For Supitcha'),
                  SizedBox(height: 40),
                  Carousel(title: 'Jump back in'),
                  SizedBox(height: 40),
                  Carousel(title: 'Recently played'),
                  SizedBox(height: 40),
                  CarouselArtist(title: 'Your favorite artists'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
