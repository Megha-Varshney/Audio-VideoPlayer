import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';

AudioPlayer Player = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: Player);
var play = false;
var stop = true;

playAudio() {
  if (play == false || stop == true) {
    audio.play("audios/myfvrt.mp3");
    play = true;
    stop = false;
  }
}

pauseAudio() {
  if (play == true) {
    Player.pause();
    play = false;
  }
}

stopAudio() {
  if (play == true && stop == false) {
    Player.stop();
    play = false;
    stop = true;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "AUDIO PLAYER",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.pinkAccent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "NICE APP",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 10,
                      backgroundColor: Colors.grey.shade200,
                      textColor: Colors.pinkAccent,
                      fontSize: 24.0,
                    );
                  },
                ),
              ],
            ),
            body: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  border: Border.all(
                    color: Colors.black87,
                    width: 5,
                  ),
                ),
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                //color: Colors.grey.shade600,
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 300,
                    height: 300,
                    //color: Colors.red.shade400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink.shade700, width: 5),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(blurRadius: 60, spreadRadius: 5),
                      ],
                    ),
                    child: Card(
                      child: Image.asset(
                        "images/image.jpg",
                        fit: BoxFit.cover,
                      ),
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
                        playAudio();
                      },
                      child: Card(
                          elevation: 5,
                          child: Text(
                            "Play Audio",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor: Colors.pinkAccent.shade200,
                                color: Colors.black),
                          )),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 20)],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade700,
                          border: Border.all(
                            color: Colors.pink.shade700,
                            width: 5,
                          )),
                      child: Card(
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: IconButton(
                                onPressed: playAudio,
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                onPressed: pauseAudio,
                                icon: Icon(
                                  Icons.pause,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                onPressed: stopAudio,
                                icon: Icon(
                                  Icons.stop,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ]))));
  }
}
