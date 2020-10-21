import 'dart:convert';
import 'dart:math' as math;

import 'package:deneme_app/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'navigate_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

String capitalize(String str) {
  // Ilk Harfi Buyultme
  return ('${str[0].toUpperCase()}${str.substring(1)}');
}

class _BodyState extends State<Body> {
  Map service;
  Map service1;
  List servicesList; //İç içe map olduğu için bunları oluşturduk.
  List servicesDone;
  String jsonUrl =
      "https://run.mocky.io/v3/164c3d1d-4bdf-45e3-bedd-e2f1afe45796";

  Future veriAl() async {
    http.Response response = await http.get(jsonUrl);
    //debugPrint(response.body);
    service = json.decode(response.body);
    service1 = await json.decode(response.body);
    setState(() {
      servicesList = service["services"];
      servicesDone = service1["services"];
    });
    //Status == Done olanlari silme
    for (int i = 0; i < servicesList.length; i++) {
      servicesList.removeWhere((element) => element["status"] == "done");
    }
    //print("serviesDone : }" + servicesDone.toString());
    //Status != Done harici olanlari Silme
    for (int j = 0; j < servicesDone.length; j++) {
      servicesDone.removeWhere((element) => element["status"] != "done");
    }
    // print("---------------------------------------------");
    // print("serviesDone : }" + servicesDone.toString());
    // print("---------------------------------------------");
    // print("serviesList : }" + servicesList.toString());
    // print(servicesList.toString());

  }

  @override
  void initState() {
    super.initState();
    veriAl();
    // veriAl1();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    setState(() {});
    return Column(
      children: [
        mainText(), // Gotham Auto Car Yazısı
        Container(
          width: size.width,
          height: 140,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height / 8),
                decoration: BoxDecoration(color: Color(0xfff1f4fb)),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    height: size.height / 5.9,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.placemark_fill),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                        child: Text(
                                            "4063 Waterview Lane, New Mexico"))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: Icon(
                                        CupertinoIcons.time_solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(child: Text("08:00 AM - 05:00 PM"))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:5,right: 5),
                          child: Container(
                            width: 1,
                            height: 60,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: kDefaultPadding + 10,
                              left: kDefaultPadding + 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return NavigateScreen();
                                },
                              ));
                            },
                            child: Container(
                              height: 40,
                              width: 70,
                              child: Center(
                                  child: Text("Open",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20))),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //Text("Service List"),
            ],
          ),
        ),
        serviceListText(),
        serviceListWidgets(size),
        doneServiceText(),
        Expanded(
          child: Container(
            color: Color(0xfff1f4fb),
            // margin: EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  doneServiceWidgets(size),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   color: Color(0xfff1f4fb),
        //   child: Container(
        //     color: Colors.transparent,
        //     padding: EdgeInsets.only(bottom: 10),
        //
        //   ),
        // )
      ],
    );
  }

  Container serviceListText() {
    return Container(
      color: Color(0xfff1f4fb),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 5.6),
          child: Text(
            'Service list',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  SizedBox serviceListWidgets(Size size) {
    return SizedBox(
      height: size.height / 3.3,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        color: Color(0xfff1f4fb),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                ListView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: servicesList == null ? 0 : servicesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        serviceListWidget(size, index),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doneServiceWidgets(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      color: Color(0xfff1f4fb),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              //Her Bir Kutu
              ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: servicesDone == null ? 0 : servicesDone.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      doneServiceWidget(size, index),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container mainText() {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding / 4),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: Center(
          child: Text(
        "Gotham Auto Car",
        style: TextStyle(color: Colors.white, fontSize: 26),
      )),
    );
  }

  Container serviceListWidget(Size size, int index) {
    return Container(
      height: size.height * 0.14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  servicesList[index]["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(servicesList[index]["model"]),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: servicesList[index]["status"] == "waiting"
                          ? Color(0xFFe94f71)
                          : Colors.orange),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      capitalize(servicesList[index]["status"].toString()),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: servicesList[index]["status"] == "done"
                      ? Colors.green
                      : Colors.black54),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container doneServiceText() {
    return Container(
      color: Color(0xfff1f4fb),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: 9,
              bottom: 10),
          child: Text(
            'Done Service',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Container doneServiceWidget(Size size, int index) {
    return Container(
      height: size.height * 0.13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  servicesDone[index]["name"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(servicesDone[index]["model"]),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      capitalize(servicesDone[index]["status"].toString()),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: servicesDone[index]["status"] == "done"
                      ? Colors.green
                      : Colors.black54),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
