import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:market/audio_detail.dart';
import './app_colors.dart' as ApColors;
import './audio_detail.dart';

class DetailAudio extends StatefulWidget {
  final booksData;
  final int index;
  const DetailAudio({super.key, required this.booksData, required this.index});

  @override
  State<DetailAudio> createState() => _DetailAudioState();
}

class _DetailAudioState extends State<DetailAudio> {
  late AudioPlayer advencedPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    advencedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ApColors.AudioBacround,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(
                height: 300,
                color: ApColors.AudioBlueBacround,
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      player.stop();
                      Navigator.of(context).pop();
                    }),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              bottom: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    Text(
                      this.widget.booksData[this.widget.index]["title"],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Text(
                      this.widget.booksData[this.widget.index]["text"],
                      style: TextStyle(fontSize: 20),
                    ),
                    AudiaPlayer_Page(
                      audioPath: this.widget.booksData[this.widget.index]
                          ["voice"],
                        
                    )
                  ],
                ),
              )),
          Positioned(
              top: screenHeight * 0.12,
              left: (screenWidth - 150) / 2,
              right: (screenWidth - 150) / 2,
              height: screenHeight * 0.16,
              child: Container(
                decoration: BoxDecoration(
                    color: ApColors.AudioGreyBackround,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                        image: DecorationImage(
                            image: AssetImage(
                              this.widget.booksData[this.widget.index]["img"],
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
