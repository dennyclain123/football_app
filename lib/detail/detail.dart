import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:football_app/objects/footballOb.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
class Detail extends StatelessWidget {
  FootballOb fob;
  Detail(this.fob);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fob.title),
        actions: [
          IconButton(
            onPressed: () => _launchURL(),
            icon: FaIcon(FontAwesomeIcons.share,size: 15,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Facts",style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),),
              Divider(),
              Text(fob.competition.name,style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${fob.side1.name}",style: Theme.of(context).textTheme.subtitle1,),
                  Text("VS",style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  Text("${fob.side2.name}",style: Theme.of(context).textTheme.subtitle1,)
                ],
              ),
              SizedBox(height: 30,),
              Text("Last Highlights",style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),),
              Divider(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: fob.videos.map((data) {
                      return Container(
                        height: 200,
                        child: Card(
                          child: Column(
                            children: [
                              Html(
                                shrinkWrap: true,
                                data: data.embed,
                              ),
                              Text(data.title)
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _launchURL() async =>
      await canLaunch(fob.url) ? await launch(fob.url) : throw 'Could not launch ${fob.url}';
}
