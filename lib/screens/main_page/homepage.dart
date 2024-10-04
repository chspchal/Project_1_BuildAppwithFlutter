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

  @override
  void initState() {
    super.initState();
    // Set greetings based on the current time
    if (currentTime.hour < 12) {
      currentGreetings = 'Good Morning';
    } else if (currentTime.hour < 17) {
      currentGreetings = 'Good Afternoon';
    } else {
      currentGreetings = 'Good Evening';
    }
  }

  void _navigateToSongPlayer(int songIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SongPlayer(songIndex: songIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer( // Right drawer
        child: ProfileDrawer(), // Your drawer content
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
                      ProfileImage(), // Profile image that opens the drawer
                    ],
                  ),
                  const SizedBox(height: 20),
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
                                int actualIndex = songIndex + index * 3; // Calculate actual index
                                return GestureDetector(
                                  onTap: () => _navigateToSongPlayer(actualIndex), // Navigate on tap
                                  child: SongBox(
                                    title: songTitlePaths[actualIndex],
                                    image: Image.asset(songImagePaths[actualIndex]),
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
