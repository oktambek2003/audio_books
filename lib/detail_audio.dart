import 'package:flutter/material.dart';
import './app_colors.dart' as ApColors;
class DetailAudio extends StatefulWidget {
  const DetailAudio({super.key});

  @override
  State<DetailAudio> createState() => _DetailAudioState();
}

class _DetailAudioState extends State<DetailAudio> {
  @override
 
  Widget build(BuildContext context) {
   final double screenHeight = MediaQuery.of(context).size.height;
   final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight/3,
              child: Container(
                height: 300,
                color:ApColors.AudioBlueBacround ,
              )),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                leading: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){}),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.search))
                ],
              ))
        ],
      ),
    );
  }
}
