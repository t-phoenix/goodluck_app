import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class DevDetails extends StatefulWidget {
  @override
  _DevDetailsState createState() => _DevDetailsState();
}

class _DevDetailsState extends State<DevDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/Tphoenix.jpeg'),
              radius: 50,
            ),
            Text(
              "Touchey_Phoenix",
              style: TextStyle(
                fontSize: 35,
                color: Colors.teal[50],
                fontWeight: FontWeight.bold,
                fontFamily: 'Chilanka',



              ),
            ),
            Text(
              "Entrepreneur/Developer",
              style: TextStyle(
                fontSize: 25,
                color: Colors.teal[50],
                fontWeight: FontWeight.bold,
                fontFamily: 'Cedarville_Cursive',
                letterSpacing: 3,
              ),
            ),
            SizedBox(
              height: 20,
              width: 300,
              child: Divider(
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final String phoneCall = 'tel: +918107599599';
                if (await launcher.canLaunch(phoneCall)) {
                  await launcher.launch(phoneCall);
                } else {
                  throw 'Error';
                }
              } ,
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal[50],
                  ),
                  title: Text(
                    "+91 8107-599-599",
                    style: TextStyle(
                      color: Colors.teal[50],
                      fontSize: 13,
                      letterSpacing: 1,
                      fontFamily: 'Caveat',
                    ),

                  ),
                ),


              ),
            ),
            GestureDetector(
              onTap: () async {
                final String sendEmail = 'mailto: abhijaipur2011@gmail.com';
                if (await launcher.canLaunch(sendEmail)) {
                  await launcher.launch(sendEmail);
                } else {
                  throw 'Error';
                }
              },
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal[50],
                  ),
                  title: Text(
                    "abhijaipur2011@gmail.com",
                    style: TextStyle(
                      color: Colors.teal[50],
                      fontSize: 13,
                      letterSpacing: 1,
                      fontFamily: 'Caveat',
                    ),

                  ),
                ),


              ),
            ),

            GestureDetector(
              onTap: () async {
                const url = 'https://www.linkedin.com/in/abhinil-agarwal-975374145/';
                if (await launcher.canLaunch(url)) {
                  await launcher.launch(url);
                } else {
                  throw 'Error';
                }
              } ,
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 80),

                child: ListTile(
                  leading: Icon(
                    Icons.person_add,
                    color: Colors.teal[50],
                  ),
                  title: Text(
                    "LinkedIn",
                    style: TextStyle(
                      color: Colors.teal[50],
                      fontSize: 13,
                      letterSpacing: 1,
                      fontFamily: 'Caveat',
                    ),

                  ),

                ),


              ),
            ),


            GestureDetector(
              onTap: () async {
                const url = 'https://www.instagram.com/touchey_phoenix/';
                if (await launcher.canLaunch(url)) {
                  await launcher.launch(url);
                } else {
                  throw 'Error';
                }
              } ,
              child: Card(
                color: Colors.black38,
                shadowColor: Colors.black,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 80),

                child: ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    color: Colors.teal[50],
                  ),
                  title: Text(
                    "Instagram",
                    style: TextStyle(
                      color: Colors.teal[50],
                      fontSize: 13,
                      letterSpacing: 1,
                      fontFamily: 'Caveat',
                    ),

                  ),

                ),


              ),
            ),





          ],
        ),

      ),

    );
  }
}
