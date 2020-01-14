import 'package:flutter/material.dart';

import 'classroom_card.dart';

void main() => runApp(SplashScreen());

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bottom Nav",
      home: BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  PageController _controller = PageController(initialPage: 0);

  List<Widget> _pageViewer = [
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  WhyFarther _selection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Bottom Nav Bar"),
        actions: <Widget>[
          // This is the type used by the popup menu below.

          // This menu button widget updates a _selection field (of type WhyFarther,
          // not shown here).
          PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther result) {
              setState(() {
                _selection = result;
                print(_selection);
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.harder,
                child: Text('Working a lot harder'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.smarter,
                child: Text('Being a lot smarter'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.selfStarter,
                child: Text('Being a self-starter'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.tradingCharter,
                child: Text('Placed in charge of trading charter'),
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
          ClassroomCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings")),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}