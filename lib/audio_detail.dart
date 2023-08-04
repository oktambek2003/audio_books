import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
  final player = AudioPlayer();
class AudiaPlayer_Page extends StatefulWidget {
  final String audioPath;
  const AudiaPlayer_Page({super.key,required this.audioPath});

  @override
  State<AudiaPlayer_Page> createState() => _AudiaPlayer_PageState();
}

class _AudiaPlayer_PageState extends State<AudiaPlayer_Page> {
  int i = 0;
  Color color = Colors.black;
  late List Books;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/books.json')
        .then((value) {
      setState(() {
        Books = json.decode(value);
      });
    });
  }


  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isplaying = false;
  bool ispaused = false;
  bool isLoop = false;
  bool isRepeat = false;
  List<IconData> _icons = [Icons.play_circle_fill, Icons.pause_circle_filled];
  String formatTime(int second) {
    return "${(Duration(seconds: second))}".split(".")[0].padLeft(8, "0");
  }

  @override
  void initState() {
    ReadData();
    // TODO: implement initState
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isplaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newduration) {
      duration = newduration;
    });
    player.onPositionChanged.listen((newposition) {
      setState(() {
        position = newposition;
      });
    });
    player.onPlayerComplete.listen((event) {
      setState(() {
        position = Duration(seconds: 0);
        isplaying = false;
        isRepeat = false;
      });
    });
  }

  Widget btnStart() {
    return IconButton(
        padding: EdgeInsets.only(bottom: 10),
        onPressed: () {
          setState(() {
            if (isplaying) {
              player.pause();
            } else {
           
             
              player.play(AssetSource(this.widget.audioPath));
            }
          });
        },
        icon: Icon(
          isplaying ? _icons[1] : _icons[0],
          color: Colors.blue,
          size: 50,
        ));
  }

  Widget btn_next_one() {
    return IconButton(
        padding: EdgeInsets.only(bottom: 10),
        onPressed: () {
          setState(() {
            i--;
            if (i < 0) {
              i = Books.length - 1;
            }

            player.play(AssetSource(Books[i][this.widget.audioPath]));
          });
          print(i);
        },
        icon: Icon(
          Icons.skip_previous,
          size: 40,
        ));
  }

  Widget btn_previos_one() {
    return IconButton(
        padding: EdgeInsets.only(bottom: 10),
        onPressed: () {
          setState(() {
            i++;
            if (i > Books.length - 1) {
              i = 0;
            }
          });
          player.play(AssetSource(Books[i][this.widget.audioPath]));
        },
        icon: Icon(
          Icons.skip_next,
          size: 40,
        ));
  }

  Widget btn_repeoat() {
    return IconButton(
        onPressed: () {
          if (isRepeat == false) {
            player.setReleaseMode(ReleaseMode.loop);
            setState(() {
              isRepeat = true;
              color = Colors.blue;
            });
          } else if (isRepeat == true) {
            player.setReleaseMode(ReleaseMode.release);
           
            setState(() {
              color = Colors.black;
              isRepeat = false;
            });
          }
        },
        icon: Icon(
          Icons.repeat,
          color: color,
        ));
  }

  Widget btnLoop() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.loop,
          color: ispaused ? Colors.blue : Colors.black,
        ));
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnLoop(),
          btn_next_one(),
          btnStart(),
          btn_previos_one(),
          btn_repeoat()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
          Slider(
              min: 0,
              activeColor: Colors.red,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                player.seek(position);
                player.resume();
              }),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position.inSeconds)),
                Text(formatTime((position - duration).inSeconds)),
              ],
            ),
          ),
          loadAsset(),
        ],
      ),
    );
  }
}
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// void main() {
//   return runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final player = AudioPlayer();
//   bool isplaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

String formatTime(int second) {
  return "${(Duration(seconds: second))}".split(".")[0].padLeft(8, "0");
}

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     player.onPlayerStateChanged.listen((state) {
//       setState(() {
//         isplaying = state == PlayerState.playing;
//       });
//     });
//     player.onDurationChanged.listen((newduration) {
//       duration = newduration;
//     });
//     player.onPositionChanged.listen((newposition) {
//       setState(() {
//         position = newposition;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 20,
//                 child: IconButton(
//                     onPressed: () {

//                       if (isplaying) {
//                         player.pause();
//                       } else {
//                         player
//                             .play(AssetSource('milena_madmusayeva_-_taxi.mp3'));
//                       }
//                     },
//                     icon: Icon(isplaying ? Icons.pause : Icons.play_arrow)),
//               ),

//               Slider(
//                   min: 0,
//                   max: duration.inSeconds.toDouble(),
//                   value: position.inSeconds.toDouble(),
//                   onChanged: (value) {
//                     final position = Duration(seconds: value.toInt());
//                     player.seek(position);
//                     player.resume();
//                   }),
//               Container(
//                 padding: EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(formatTime(position.inSeconds)),
//                     Text(formatTime((position - duration).inSeconds))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
