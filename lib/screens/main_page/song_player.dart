import 'package:animate_do/animate_do.dart';
import 'package:build_app/constants/constant.dart';
import 'package:build_app/data/data.dart';
import 'package:flutter/material.dart';



class SongPlayer extends StatefulWidget {
  const SongPlayer({super.key, required this.songIndex});

  final int songIndex;

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  bool isFavorited = false;
  bool isPlaying = false;
  Duration duration = Duration(seconds: 300);
  Duration position = Duration.zero;

  void playPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void updateSlider(double value) {
    setState(() {
      position = Duration(seconds: value.toInt());
    });
  }

  void previousSong() {
    // Logic for previous song (you can implement your own logic here)
    if (widget.songIndex > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SongPlayer(songIndex: widget.songIndex - 1),
        ),
      );
    }
  }

  void nextSong() {
    // Logic for next song (you can implement your own logic here)
    if (widget.songIndex < songImagePaths.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SongPlayer(songIndex: widget.songIndex + 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.songIndex < 0 || widget.songIndex >= songImagePaths.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Invalid Index'),
        ),
        body: Center(
          child: Text('No image available'),
        ),
      );
    }

    Duration remaining = duration - position;

    return FadeInUp(
      duration: Duration(milliseconds: 400),
      delay: Duration(milliseconds: 200),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            'Now playing',
            style: MenuText,
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.more_vert_rounded,
                size: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              SongCover(widget: widget),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SongDetail(songIndex: widget.songIndex),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_outline_outlined,
                      size: 30,
                      color: isFavorited ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}', // เวลาเพลงดำเนินไป
                    style: SubText,
                  ),
                  Expanded(
                    child: Slider(
                      value: position.inSeconds.toDouble(),
                      onChanged: isPlaying ? updateSlider : null,
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      activeColor: AppColors.primary,
                      inactiveColor: Colors.grey,
                    ),
                  ),
                  Text(
                    '${remaining.inMinutes}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}', // เวลาที่เหลือ
                    style: SubText,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: previousSong,
                    icon: Icon(Icons.skip_previous, size: 40, color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: playPause,
                    icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.black,
                        
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: nextSong,
                    icon: Icon(Icons.skip_next, size: 40, color: Colors.grey),
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

class SongCover extends StatelessWidget {
  const SongCover({super.key, required this.widget});

  final SongPlayer widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(songImagePaths[widget.songIndex]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SongDetail extends StatelessWidget {
  const SongDetail({super.key, required this.songIndex});

  final int songIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            songTitlePaths[songIndex],
            style: SongTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            artistNamePaths[songIndex],
            style: SongArtist,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
