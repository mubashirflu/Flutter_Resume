import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/jsondata.dart';
import 'dart:convert';

class Hobies extends StatelessWidget {
  Future<Student?> loasAsset() async {
    var loadjson = await rootBundle.loadString("assets/data.json");
    var jsondecode = await json.decode(loadjson);
    Student Mubashir = Student.fromJson(jsondecode);
    return Mubashir;
  }

  @override
  Widget build(BuildContext context) {
    loasAsset();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Hobies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
            tooltip: "Hobies",
          )
        ],
      ),
      body: FutureBuilder(
        future: loasAsset(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child:
                        Text(snapshot.data!.education[0]!.educationImportance!),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Hobies",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Column(
                  children: [
                    ...List.generate(snapshot.data!.hobies.length, (index) {
                      return ListTile(
                        leading: Icon(
                          FontAwesomeIcons.solidCircle,
                          size: 12.0,
                          color: Colors.grey.shade600,
                        ),
                        title: Text(snapshot.data!.hobies[index]!),
                      );
                    })
                  ],
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Contact Detail",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Column(
                  children: [
                    ...List.generate(snapshot.data!.contactNumber.length,
                        (index) {
                      return ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 18.0,
                          color: Colors.grey.shade600,
                        ),
                        title: Text(snapshot
                                .data!.contactNumber[0]!.phoneNumber! +
                            "\n" +
                            snapshot.data!.contactNumber[0]!.emergenyNumber!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!.contactNumber[0]!.email!),
                            Text(snapshot.data!.contactNumber[0]!.skype!)
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
