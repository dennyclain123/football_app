import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PopularPage extends StatefulWidget {
  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
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
                  child: legendPlayers("assets/images/rooney.jpg", "Rooney"),
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Wayne_Rooney";
                    _launchURL(url);
                  }),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Ronaldo_(Brazilian_footballer)";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/ronaldo.jpg", "Ronaldo")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Pel%C3%A9";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/pele.jpeg", "Pele")
              ),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Diego_Maradona";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/maradona.jpg", "Maradona")
              ),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Andrea_Pirlo";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/pirlo.jpg", "Pirlo")
              ),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/David_Beckham";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/backham.jpg", "David Backham")
              ),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Zinedine_Zidane";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/zidane.jpg", "Zidane")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Kak%C3%A1";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/kaka.jpg", "Ricardo KaKa")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Ronaldinho";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/ronaldinho.jpg", "Ronaldinho")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Lionel_Messi";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/messi.jpg", "David Lionel Messi")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Cristiano_Ronaldo";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/cr7.jpg", "Christiano Ronaldo")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Neymar";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/naymar.jpg", "Naymar Jr")),
              InkWell(
                  onTap: () {
                    String url = "https://en.wikipedia.org/wiki/Zlatan_Ibrahimovi%C4%87";
                    _launchURL(url);
                  },
                  child: legendPlayers("assets/images/zlatan.jpg", "Zlatan Ibrahimović")),

            ],
          ),
        ),
      ],
    ));
  }

  Container legendPlayers(String img, String name) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              img,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: 140,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: Colors.black.withOpacity(.5),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
