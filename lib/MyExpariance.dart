import 'dart:io';
import 'dart:js_util';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/jsondata.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';

class MyExperiance extends StatelessWidget {
  Future<Student?> loadAssets() async {
    var loadjson = await rootBundle.loadString("assets/data.json");
    var jsondecode = json.decode(loadjson);
    Student mubashir = Student.fromJson(jsondecode);
    return mubashir;
  }

  @override
  Widget build(BuildContext context) {
    loadAssets();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Experiance",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
            tooltip: "No more Experiance found",
          )
        ],
      ),
      body: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<Student?> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: Text(
                        snapshot.data!.experiance[0]!.experianceDescription!),
                  ),
                  buildeducation("Worked Experiance"),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Column(
                    children: [
                      for (var i = 0; i < 2; i++)
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.solidCircle,
                            size: 12.0,
                            color: Colors.grey.shade500,
                          ),
                          title: Text(
                            snapshot.data!.experiance[i]!.company!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.experiance[i]!.position! +
                                  "\n" +
                                  snapshot.data!.experiance[i]!.year! +
                                  "\n" +
                                  snapshot.data!.experiance[i]!.experiance!),
                              Row(
                                children: [
                                  Text(snapshot.data!.education[i]!.address!),
                                  IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: Colors.indigo,
                                    ),
                                    onPressed: () {
                                      _launchURl(
                                          "https://www.google.com/maps/place/Shah+Faisal+Colony,+Karachi,+Karachi+City,+Sindh,+Pakistan/@24.8728803,67.1446319,14z/data=!3m1!4b1!4m5!3m4!1s0x3eb3399d42aef5f1:0xa5813c4e620196a7!8m2!3d24.8773062!4d67.1591053");
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  _launchURl(String url) async {
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Padding buildeducation(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
