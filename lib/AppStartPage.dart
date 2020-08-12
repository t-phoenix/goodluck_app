import 'dart:math';

import 'package:flutter/material.dart';

import 'package:goodluck_app/DevDetails.dart';
import 'package:goodluck_app/HomePage.dart';


class AppStartPage extends StatefulWidget {
  @override
  _AppStartPageState createState() => _AppStartPageState();
}

class _AppStartPageState extends State<AppStartPage> {

  get bottomAppBarContents => null;

  int _selectedIndex = 0;
  //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = [
    HomePage(),
    DevDetails(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("v___________INDEX HERE _________v");
      print(index);
    });
  }

  int  generateRandomNumber() {

    var random = new Random();
    int num = random.nextInt(70);
    // Printing Random Number between 1 to 100 on Terminal Window.

    return num;
  }

  int _counter=0;
  void _incrementCounter() {
    setState(() {
      _counter= 30 + generateRandomNumber();
      print(_counter);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //body: _widgetOptions[_selectedIndex],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              floating: false,
              pinned: true,


              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,

                title: Text("Luck Bar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Cedarville_Cursive',

                    )),
                background: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                        width: 20,
                      ),
                      Container(
                        child: Text("Your luck Percentage is :" + _counter.toString(),
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cedarville_Cursive',


                          ),
                        ),

                      )

                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/Appbar_glimmer.png'),
                      fit: BoxFit.fill,
                    ),
                    //shape: BoxShape.circle,
                  ),
                ),

                //background: Image.asset('assets/Appbar_glimmer.png', fit: BoxFit.cover,),

              ),


            ),
          ];
        },
        body: _widgetOptions[_selectedIndex],

      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.orange,
        child: Icon(Icons.thumbs_up_down),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      //ADDED BOTTOM NAVIGATION BAR
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home',
              style: TextStyle(
                fontFamily: 'Cedarville_Cursive',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Developer',
              style: TextStyle(
                fontFamily: 'Cedarville_Cursive',
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      //ADDED LOCATION OF ACTION BUTTON



    );
  }
}
