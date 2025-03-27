import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SMS_Demo extends StatefulWidget {
  const SMS_Demo({super.key});

  @override
  State<SMS_Demo> createState() => _SMS_DemoState();
}

//It sends mail,SMS, and make a call using external Applications
class _SMS_DemoState extends State<SMS_Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,
        title: Text(
          "SMS Demo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 20,
          bottom: 10,
          left: 20,
        ),
        child: Column(
          children: [
            Text(
              "Welcome to Peoplescope App",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "For any query, Mail Us",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                sendMail();
              },
              child: Text("Send Mail", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text("or SMS Us"),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                sendSMS();
              },
              child: Text("Send SMS", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
  const Text(
                  'For further Updates',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                            SizedBox(height: 20),

             ElevatedButton(
                  onPressed: makingPhoneCall,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white
                  ),
                  child: const Text('Here'),
                ), //
          ],
        ),
      ),
    );
  }

  Future<void> sendMail() async {
    var url = Uri.parse("mailto:halkudepooja@gmail.com");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> sendSMS() async {
    var url = Uri.parse("sms:9049641515");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

makingPhoneCall() async {
  var url = Uri.parse("tel:1234567890");
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
}
