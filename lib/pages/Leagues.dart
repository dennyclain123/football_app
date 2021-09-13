import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Leagues extends StatefulWidget {
  @override
  _LeaguesState createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(2),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            children: [
              InkWell(
                  child: legendPlayers(
                      "assets/images/EPL-LOGO.jpg", "England Premier-League"),
                  onTap: () {
                    String url = "https://www.premierleague.com/tables";
                    _launchURL(url);
                  }),
              InkWell(
                  onTap: () {
                    String url =
                        "https://www.skysports.com/la-liga-table";
                    _launchURL(url);
                  },
                  child: legendPlayers(
                      "assets/images/laliga-1534239805985.jpg", "Spain La-Liga")),
              InkWell(
                  onTap: () {
                    String url = "https://www.skysports.com/serie-a-table";
                    _launchURL(url);
                  },
                  child: legendPlayers(
                      "assets/images/swipe serie A no anno.png", "Itally Serie-A")),
              InkWell(
                  onTap: () {
                    String url = "https://www.bundesliga.com/en/bundesliga/table";
                    _launchURL(url);
                  },
                  child: legendPlayers(
                      "assets/images/German-Bundesliga-logo.jpg", "Germany-Bundesliga")),
              InkWell(
                  onTap: () {
                    String url = "https://www.uefa.com/uefachampionsleague/";
                    _launchURL(url);
                  },
                  child: legendPlayers(
                      "assets/images/7924eccaf6779819242591fab54021e5.jpg", "UEFA Champions League")),
              InkWell(
                  onTap: () {
                    String url = "https://www.uefa.com/uefaeuropaleague/";
                    _launchURL(url);
                  },
                  child: legendPlayers(
                      "assets/images/uefa-europa-league-final-referees.jpg", "UEFA Europa League")),
            ],
          ),
        ),
      ],
    ));
  }

  Container legendPlayers(String img, String name) {
    return Container(
        child: Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              img,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(name),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
