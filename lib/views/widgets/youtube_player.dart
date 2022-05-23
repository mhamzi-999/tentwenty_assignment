
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tentwenty/helpers/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  final String videoUrl;
  const YoutubeVideo({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState(){
    super.initState();
    initializeVideoPlayer();
  }
  Future<void> initializeVideoPlayer() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
     _controller = YoutubePlayerController(
      initialVideoId: widget.videoUrl,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    exitScreen();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: (){
        exitScreen();
        Navigator.of(context).pop();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              onEnded: (metaData){
                exitScreen();
                Navigator.of(context).pop();
              },
              topActions: [
                InkWell(
                    onTap: (){
                      exitScreen();
                      Navigator.of(context).pop();
                    },
                    child: Text("Done",style: TextStyle(color: CONSTANTS.colorFromHex("FFFFFF"),fontSize: 20),))
              ],
            ),

            builder: (context,player){
              return Expanded(child: player);
            }
          ),
        ),
      ),
    );
}


exitScreen(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top,SystemUiOverlay.bottom]);
}
}
