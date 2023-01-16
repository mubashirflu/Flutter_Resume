import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Hobies.dart';
import 'package:flutter_application_2/MyExpariance.dart';
import 'package:flutter_application_2/Skills.dart';
import 'package:flutter_application_2/jsondata.dart';
import 'package:flutter_application_2/profile.dart';
import 'dart:convert';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_2/MyEducation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  Future<Student?> loadAssets() async {
    var loadjson = await rootBundle.loadString("assets/data.json");
    var jsondecode = await json.decode(loadjson);
    Student Mubashir = Student.fromJson(jsondecode);
    return Mubashir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Flutter Resume",
          style: TextStyle(fontFamily: "Billabong", fontSize: 16.0),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(FontAwesomeIcons.commentDots),
            tooltip: "comment",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: "more_icon",
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Center(
                child: UserAccountsDrawerHeader(
                  currentAccountPicture: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                  accountName: const Text(
                    "Muhammad Mubashir",
                    style: TextStyle(fontSize: 25.0, fontFamily: "Billabong"),
                  ),
                  accountEmail: Text("yawaseo791@gmail.com"),
                  decoration: BoxDecoration(color: Colors.indigo),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home page',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Homepage();
                }));
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(FontAwesomeIcons.school),
              title: Text(
                'Education Detail',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyEducation();
                }));
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(FontAwesomeIcons.expand),
              title: Text(
                "Experiance",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MyExperiance();
                }));
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.skip_next_outlined),
              title: Text(
                "Skills",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Skills();
                }));
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(FontAwesomeIcons.schlix),
              title: Text(
                "Hobies",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Hobies();
                }));
              },
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.info),
              title: Text(
                "profile Update",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return profile();
                }));
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: loadAssets(),
        builder: (context, AsyncSnapshot<Student?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildNames(snapshot),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      child: Text("${snapshot.data!.profession}"),
                    ),
                    buildskillsRow("skills"),
                    buildskills(snapshot),
                    SizedBox(height: 10.0),
                    buildskillsRow("Education"),
                    buildEducation(snapshot),
                    SizedBox(height: 5.0),
                    buildskillsRow("Experiance"),
                    SizedBox(height: 5.0),
                    buildexperiancerow(snapshot),
                    buildskillsRow("Hobies"),
                    buildHobies(snapshot),
                    SizedBox(height: 10.0),
                    buildskillsRow("Contact Detail"),
                    SizedBox(height: 5.0),
                    buildcontact(snapshot),
                    SizedBox(height: 10.0),
                    buildskillsRow("Socials"),
                    buildsocialrow(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Row buildsocialrow() {
    return Row(
      children: [
        SizedBox(width: 10.0),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.facebook,
            size: 20.0,
            color: Colors.indigo,
          ),
          onPressed: () {
            _launchURl(
                "https://www.facebook.com/profile.php?id=100016564213126");
          },
        ),
        SizedBox(width: 10.0),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.github,
            size: 20.0,
            color: Colors.grey,
          ),
          onPressed: () {
            _launchURl("https://github.com/mubashirflu/C-programming-");
          },
        ),
        SizedBox(width: 10.0),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.youtube,
            size: 20.0,
            color: Colors.red,
          ),
          onPressed: () {
            _launchURl(
                "https://www.youtube.com/channel/UCp-FNZ2tjh6HgXVU9O89B5Q");
          },
        )
      ],
    );
  }

  _launchURl(String url) async {
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile buildcontact(AsyncSnapshot<Student?> snapshot) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(snapshot.data!.contactNumber[0]!.phoneNumber! +
          "\n" +
          snapshot.data!.contactNumber[0]!.emergenyNumber! +
          "\n" +
          snapshot.data!.contactNumber[0]!.email! +
          "\n" +
          snapshot.data!.contactNumber[0]!.skype!),
    );
  }

  Column buildHobies(AsyncSnapshot<Student?> snapshot) {
    return Column(
      children: [
        for (var i = 0; i < 3; i++)
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidCircle,
              size: 12.0,
              color: Colors.grey.shade600,
            ),
            title: Text(snapshot.data!.hobies[i]!),
          ),
        Divider(
          color: Colors.grey.shade300,
        )
      ],
    );
  }

  Column buildEducation(AsyncSnapshot<Student?> snapshot) {
    return Column(
      children: [
        for (var i = 0; i < 3; i++)
          ListTile(
              leading: Icon(FontAwesomeIcons.solidCircle,
                  color: Colors.grey.shade600, size: 12.0),
              title: Text(
                snapshot.data!.education[i]!.name!,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data!.education[i]!.title! +
                      "\n" +
                      snapshot.data!.education[i]!.percentage! +
                      "\n" +
                      snapshot.data!.education[i]!.field! +
                      "\n" +
                      snapshot.data!.education[i]!.board! +
                      "\n" +
                      snapshot.data!.education[i]!.passingYear! +
                      "\n" +
                      snapshot.data!.education[i]!.address!),
                ],
              )),
        Divider(
          color: Colors.grey.shade300,
        )
      ],
    );
  }

  Column buildexperiancerow(AsyncSnapshot<Student?> snapshot) {
    return Column(
      children: [
        for (var i = 0; i < 2; i++)
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidCircle,
              size: 12.0,
              color: Colors.grey.shade600,
            ),
            title: Text(snapshot.data!.experiance[i]!.company!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data!.experiance[i]!.position!),
                Text(snapshot.data!.experiance[i]!.year!)
              ],
            ),
          ),
        Divider(
          color: Colors.grey.shade300,
        ),
      ],
    );
  }

  Column buildskills(AsyncSnapshot<Student?> snapshot) {
    return Column(
      children: [
        ...List.generate(snapshot.data!.skills.length, (index) {
          return Card(
            color: Colors.white10,
            child: ListTile(
              leading: Icon(
                FontAwesomeIcons.solidCircle,
                size: 12.0,
                color: Colors.grey.shade600,
              ),
              title: Text(snapshot.data!.skills[index]!),
            ),
            elevation: 0.0,
          );
        }),
        Divider(
          color: Colors.grey.shade300,
        )
      ],
    );
  }

  Padding buildskillsRow(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Billabong"),
      ),
    );
  }

  Row buildNames(AsyncSnapshot<Student?> snapshot) {
    return Row(
      children: [
        SizedBox(width: 20.0),
        Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${snapshot.data!.name}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Text("${snapshot.data!.designation}"),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey.shade500,
                ),
                Text(
                  "${snapshot.data!.living}",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
