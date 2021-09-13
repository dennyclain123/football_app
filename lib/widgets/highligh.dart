import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/objects/footballOb.dart';
class HighPage extends StatelessWidget {
  FootballOb fob;
  HighPage(this.fob);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              imageUrl: fob.thumbnail,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Theme.of(context).primaryColor,)),
              errorWidget: (context, url, error) => Icon(Icons.error,color: Theme.of(context).primaryColor,),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  fob.title,
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      )
    );
  }
}
