import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:football_app/pages/Leagues.dart';
import 'package:football_app/pages/Popular_page.dart';
import 'package:football_app/pages/footballPage/football_page.dart';
import 'package:football_app/pages/settings/more.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> pageList = [FootBallPage(), PopularPage(),Leagues(),Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Football App",style: TextStyle(fontSize: 18),),
              // accountEmail: new Text("dennyclain123@gmail.com"),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/ballpurple.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              // currentAccountPicture: CircleAvatar(
              //     backgroundImage: ExactAssetImage('assets/images/ballpurple.jpg')),
            ),
            new ListTile(
                leading: FaIcon(FontAwesomeIcons.link,size: 15),
                title: new Text("Football Website"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      // builder: (context) => About()
                      ));
                }),
            new Divider(),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Communicate",
                  style: Theme.of(context).textTheme.headline6
                )),
            SizedBox(
              height: 10,
            ),
            new ListTile(
                leading: FaIcon(FontAwesomeIcons.share,size: 15),
                title: new Text("Share"),
                onTap: () {
                  // html.window.open("https://github.com/dennyclain123", "github");
                }),
            new ListTile(
                leading: FaIcon(FontAwesomeIcons.facebookF,size: 15),
                title: new Text("Facebook"),
                onTap: () {
                  // html.window.open("https://www.facebook.com/profile.php?id=100010088020235", "facebook");
                }),
            new ListTile(
                leading: FaIcon(FontAwesomeIcons.lock,size: 15),
                title: new Text("Privacy"),
                onTap: () {
                  // html.window.open("https://www.facebook.com/profile.php?id=100010088020235", "facebook");
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Football Application"),
      ),
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.video,size: 15,), title: Text("Highlights")),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userFriends,size: 15), title: Text("Pupular")),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.trophy,size: 15), title: Text("Leagues")),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.ellipsisH,size: 15), title: Text("More")),
        ],
      ),
    );
  }
}
