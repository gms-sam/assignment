import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({Key? key}) : super(key: key);

  @override
  _BedRoomState createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  Color? color;

  Widget mainCard({required String title, required String asset}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: EdgeInsets.only(left: 25, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/" + asset + ".svg",
            color: Colors.blue[900],
            height: 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget scenesCard({required String title, required Color color}) {
    return Container(
      height: 60,
      width: 180,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/surface2.svg"),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget colorButton({required Color backgroundColor}) {
    return InkWell(
      onTap: () {
        setState(() {
          this.color = backgroundColor;
        });
      },
      child: CircleAvatar(
        backgroundColor: backgroundColor,
      ),
    );
  }

  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                "assets/Icon ionic-md-arrow-round-back.svg",
                                height: 20,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Bed",
                            style: TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        "Room",
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1500),
                        child: SvgPicture.asset(
                          "assets/light bulb.svg",
                          key: UniqueKey(),
                          color: color,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/Group 38.svg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: Text(
                "4 lights",
                style: TextStyle(color: Colors.orange, fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30, top: 10),
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  mainCard(title: "Main Light", asset: "surface1"),
                  // mainCard(title: "Desk Lights",asset: "furniture-and-household"),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[900]),
                    margin: EdgeInsets.only(left: 25, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          "assets/furniture-and-household.svg",
                          color: Colors.white,
                          height: 30,
                        ),
                        Text(
                          "Desk Light",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  mainCard(title: "Bed light", asset: "bed (1)")
                ],
              ),
            )
          ],
        ),
        Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Intensity",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/solution1.svg"),
                          Container(
                            child: Slider(
                                activeColor: Colors.orange,
                                inactiveColor: Colors.grey.shade100,
                                value: color != null ? color!.opacity : value,
                                min: 0,
                                max: 1,
                                onChanged: (v) {
                                  if (color != null) {
                                    setState(() {
                                      color = color!.withOpacity(v);
                                    });
                                  }
                                }),
                          ),
                          SvgPicture.asset("assets/solution.svg")
                        ],
                      ),
                      Text(
                        "Colors",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            colorButton(
                              backgroundColor: Colors.purple,
                            ),
                            colorButton(
                              backgroundColor: Colors.blue,
                            ),
                            colorButton(
                              backgroundColor: Colors.orange,
                            ),
                            colorButton(
                              backgroundColor: Colors.yellow,
                            ),
                            colorButton(
                              backgroundColor: Colors.grey,
                            ),
                            colorButton(
                              backgroundColor: Colors.green,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              child: SvgPicture.asset("assets/+.svg"),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Scenes",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w600),
                      ),
                      GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2),
                        children: [
                          scenesCard(
                              title: "Birthday", color: Colors.pink.shade100),
                          scenesCard(
                              title: "Party", color: Colors.indigo.shade100),
                          scenesCard(
                              title: "Relax", color: Colors.blue.shade100),
                          scenesCard(
                              title: "Fun", color: Colors.green.shade100),
                        ],
                      )
                    ])))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/bulb.svg"), label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icon feather-home.svg"),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icon feather-settings.svg"),
              label: ""),
        ],
      ),
    );
  }
}
