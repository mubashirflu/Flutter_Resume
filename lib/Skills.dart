import 'dart:convert';

import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/jsondata.dart';

class Skills extends StatelessWidget {
  Future<Student?> loadAsse() async {
    var loadjson = await rootBundle.loadString("assets/data.json");
    var jsondecode = json.decode(loadjson);
    Student Mubashir = Student.fromJson(jsondecode);
    return Mubashir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skills"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
            tooltip: "No More skills",
          ),
        ],
      ),
      body: FutureBuilder(
        future: loadAsse(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            return Stack(
              children: [
                Container(
                    height: 300,
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: ListView.builder(
                        itemCount: snapshot.data!.skills.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(
                              FontAwesomeIcons.solidCircle,
                              size: 12.0,
                              color: Colors.white,
                            ),
                            title: Text(
                              snapshot.data!.skills[index]!,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          );
                        })),
              ],
            );
          }
        },
      ),
    );
  }
}
