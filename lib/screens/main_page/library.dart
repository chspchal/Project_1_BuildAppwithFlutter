import 'package:build_app/constants/constant.dart';
import 'package:build_app/data/data.dart';
import 'package:build_app/screens/component/drawer.dart';
import 'package:build_app/screens/component/profile_image.dart';
import 'package:build_app/screens/main_page/like_page.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    // Filter playlist based on search query
    final filteredPlaylist = playlistNamePaths
        .where((song) => song.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      endDrawer: Drawer(
        child: ProfileDrawer(), // Right drawer content
      ),
      body: SingleChildScrollView(
        // Make the entire body scrollable
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and profile image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Library', style: Head),
                  ProfileImage(),
                ],
              ),
              const SizedBox(height: 20),

              // Search TextField
              TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                style: SearchText,
                decoration: InputDecoration(
                  hintText: 'Find your favorites',
                  hintStyle: HintText,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 10),
                    child: Icon(Icons.search, color: AppColors.darkGrey, size: 30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Display search results or playlists
              if (query.isNotEmpty) ...[
                Text(
                  'Playlist:',
                  style: MenuText,
                ),
                ...filteredPlaylist.map((song) => ListTile(
                      title: Text(song, style: LabelText),
                    )),
                const SizedBox(height: 20),
              ],
              Text(
                'Browse all',
                style: MenuText,
              ),

              // Playlist List
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
                shrinkWrap: true, // Take only the space needed
                itemCount: playlistNamePaths.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10), // Add spacing here
                    decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Check if the tapped playlist is "Liked Songs"
                        if (playlistNamePaths[index] == 'Liked Songs') {
                          // Navigate to the LikeSong page without passing liked songs
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LikeSong(),
                            ),
                          );
                        }
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Container(
                          width: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              playlistImagePaths[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          playlistNamePaths[index],
                          style: TitleText,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Add Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Action for adding
                      },
                      icon: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
