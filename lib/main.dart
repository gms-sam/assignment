import 'package:assignment/bed_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget myCard(
      {required String asset,
      required String title,
      required String subtitle,
      Widget? page}) {
    return InkWell(
      onTap: () {
        if (page != null)
          Navigator.push(context, MaterialPageRoute(builder: (c) => page));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset("assets/" + asset + ".svg"),
            Spacer(),
            Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 15, color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 60, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Control\nPanel",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                SvgPicture.asset(
                  "assets/user.svg",
                ),
                //)
              ],
            ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "All Rooms",
                      style:
                          TextStyle(fontSize: 25, color: Colors.blue.shade900),
                    ),
                  ),
                  GridView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: [
                        myCard(
                          asset: "bed",
                          title: "Bed room",
                          subtitle: '4 Lights',
                          page: BedRoom(),
                        ),
                        myCard(
                            asset: "room",
                            title: "Living room",
                            subtitle: '2 Lights'),
                        myCard(
                            asset: "kitchen",
                            title: "Kitchen",
                            subtitle: '5 Lights'),
                        myCard(
                            asset: "bathtube",
                            title: "Bathroom",
                            subtitle: '1 Lights'),
                        myCard(
                            asset: "house",
                            title: "Outdoor",
                            subtitle: '5 Lights'),
                        myCard(
                            asset: "balcony",
                            title: "Balcony",
                            subtitle: '2 Lights'),
                      ])
                ],
              ),
            ),
          )
        ],
      ),
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
