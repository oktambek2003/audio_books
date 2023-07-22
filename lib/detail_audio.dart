
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:market/audio_detail.dart';

import './app_colors.dart' as ApColors;

class DetailAudio extends StatefulWidget {
  const DetailAudio({super.key});

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
                    icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
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
                      "THE WATER CURE",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Text(
                      "Martin Hyatt",
                      style: TextStyle(fontSize: 20),
                    ),
                    AudiaPlayer_Page()
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
                            image: AssetImage("assets/music_vertical3.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
