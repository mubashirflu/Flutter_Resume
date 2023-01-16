import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/jsondata.dart';
import 'dart:convert';

import 'package:flutter_application_2/main.dart';

class profile extends StatelessWidget {
  Future<Student?> loadAssets() async {
    var loadjson = await rootBundle.loadString("assets/data.json");
    var jsondecode = await json.decode(loadjson);
    Student Mubashir = Student.fromJson(jsondecode);
    return Mubashir;
  }

  @override
  Widget build(BuildContext context) {
    loadAssets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Profile Update"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
            tooltip: "update your profile",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: loadAssets(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return LinearProgressIndicator();
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.indigo),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 90.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Form(
                            child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Enter your  Name",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter the your Addess"
                                    : null;
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Father Name",
                                hintText: "Enter your Father Name",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter the your Father Name"
                                    : null;
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Contact Number",
                                hintText: "Enter the Contact Number",
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter the Contact Number"
                                    : null;
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email Address",
                                hintText: "Enter the  Email Address ",
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter the Email Address"
                                    : null;
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Education",
                                hintText: "Enter Your Education",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter Your Education"
                                    : null;
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Skills",
                                hintText: "Enter Your Skills",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter Your Skills"
                                    : null;
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Experiance",
                                hintText: "Enter Your Experiance",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Enter Your Experiance"
                                    : null;
                              },
                            ),
                            SizedBox(height: 10.0),
                            MaterialButton(
                              color: Colors.indigo,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Homepage();
                                }));
                              },
                              child: Text(
                                "Up date",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
