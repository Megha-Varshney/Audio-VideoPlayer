import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    home: SamplePlayer(),
    debugShowCheckedModeBanner: false,
  ));
}

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset("asset/video.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "VIDEO PLAYER",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue.shade900,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("nyc app");
                  },
                ),
              ],
            ),
            body: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  border: Border.all(
                    color: Colors.black87,
                    width: 5,
                  ),
                ),
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.shade900, width: 5),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(blurRadius: 60, spreadRadius: 5),
                      ],
                    ),
                    child: Card(
                      child: FlickVideoPlayer(flickManager: flickManager),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black54,
                          width: 5,
                        )),
                    child: RaisedButton(
                      onPressed: () {
                        print("Audio........");
                        VideoPlayerController;
                      },
                      child: Card(
                          elevation: 5,
                          child: Text(
                            "Play Video",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor: Colors.blue.shade500,
                                color: Colors.black),
                          )),
                    ),
                  ),
                ]))));
  }
}
