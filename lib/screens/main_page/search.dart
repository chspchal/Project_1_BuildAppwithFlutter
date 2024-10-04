import 'package:build_app/constants/constant.dart';
import 'package:build_app/data/data.dart';
import 'package:build_app/screens/component/drawer.dart';
import 'package:build_app/screens/component/profile_image.dart';
import 'package:flutter/material.dart';



class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredSongs = songTitlePaths
        .where((song) => song.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final filteredArtists = fullArtistNamePaths
        .where((artist) => artist.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      endDrawer: Drawer( // Right drawer
        child: ProfileDrawer(), // Your drawer content
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: Head
                  ),
                  ProfileImage(),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                style: SearchText,
                decoration: InputDecoration(
                  hintText: 'What do you want to listen to?',
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

              // Display matched songs and artists
              if (query.isNotEmpty) ...[
                Text(
                  'Songs:',
                  style: MenuText,
                ),
                ...filteredSongs.map((song) => ListTile(
                      title: Text(song, style: LabelText),
                    )),
                const SizedBox(height: 20),
                Text(
                  'Artists:',
                  style: MenuText
                ),
                ...filteredArtists.map((artist) => ListTile(
                      title: Text(artist, style: LabelText),
                    )),
                const SizedBox(height: 20),
              ],

              // Categories GridView
              Text(
                'Browse all',
                style: MenuText,
              ),
              const SizedBox(height: 5),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      categories[index],
                      style: MenuText,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
