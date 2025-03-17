import 'package:flutter/material.dart';
import 'package:flutter_screen_design_ideas/Buttons/simple_round_button.dart';
import 'package:flutter_screen_design_ideas/Buttons/simple_round_button_icon.dart';
import 'package:flutter_screen_design_ideas/Buttons/simple_round_button_only_icon.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Demo")),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              SimpleRoundButton(
                backgroundColor: Colors.blue,
                buttonText: Text(
                  "LOGIN",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SimpleRoundIconButton(
                backgroundColor: Colors.indigo,
                buttonText: Text(
                  "Send Email",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.email),
                iconAlignment: Alignment.center,
              ),

              SimpleRoundIconButton(
                backgroundColor: Colors.blueGrey,
                buttonText: Text(
                  "LISTEN TO MUSIC",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.headset_mic),
                iconAlignment: Alignment.centerRight,
              ),
              SimpleRoundIconButton(
                backgroundColor: Colors.deepOrangeAccent,
                buttonText: Text(
                  "SHARE ON SOCIAL",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.share),
                iconAlignment: Alignment.centerRight,
              ),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.lightGreen,
                icon: Icon(Icons.share),
                iconAlignment: Alignment.center,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SimpleRoundOnlyIconButton(
                      backgroundColor: Colors.blueAccent,
                      icon: Icon(Icons.phone),
                      iconAlignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SimpleRoundOnlyIconButton(
                      backgroundColor: Colors.redAccent,
                      icon: Icon(Icons.message),
                      iconAlignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.green,
                icon: Icon(Icons.message),
                iconColor: Colors.green,
                iconAlignment: Alignment.centerRight,
              ),
              SimpleRoundOnlyIconButton(
                backgroundColor: Colors.redAccent,
                icon: Icon(Icons.details),
                iconColor: Colors.redAccent,
                iconAlignment: Alignment.centerLeft,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.66,
                    child: SimpleRoundIconButton(
                      backgroundColor: Colors.deepOrangeAccent,
                      buttonText: Text(
                        "PLAY",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.play_arrow),
                      iconAlignment: Alignment.centerRight,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: SimpleRoundButton(
                      backgroundColor: Colors.greenAccent,
                      buttonText: Text(
                        "OK",
                        style: TextStyle(color: Colors.green),
                      ),
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
