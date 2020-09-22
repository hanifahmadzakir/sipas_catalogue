import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sipas_userapps/BugReport.dart';
import 'package:sipas_userapps/MapsPage.dart';
import 'package:sipas_userapps/auth_services.dart';

class Mainpage extends StatefulWidget {
  final FirebaseUser user;
  Mainpage(this.user);
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(0, 96, 255, 1);
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Beta User'),
              accountEmail: Text('betauser@sipas.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black26,
                child: new Text('S'),
              ),
              decoration: new BoxDecoration(color: primaryColor),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: new Text('Y'),
                ),
                new CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: new Text('W'),
                ),
              ],
            ),
            //new ListTile(
              //title: new Text('Home page'),
              //trailing: new Icon(Icons.home),
              //onTap: () {
                //Navigator.pop(context);
              //},
            //),
            new ListTile(
              title: new Text('Parking List'),
              trailing: new Icon(Icons.local_parking),
            ),
            new ListTile(
              title: new Text('Parking Map'),
              trailing: new Icon(Icons.map),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MapsPage();
                }));
              },
            ),
            new ListTile(
              title: new Text('Bug Report'),
              trailing: new Icon(Icons.report),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BugReport();
                }));
              },
            ),
            new ListTile(
              title: new Text('Logout'),
              trailing: new Icon(Icons.exit_to_app),
              onTap: () async {
                await AuthServices.signOut();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primaryColor, border: Border.all(color: primaryColor)),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        showDialog(
                      context: context,
                      child: new AlertDialog(
                        title: new Text(
                            'Notification'),
                        content: new Text(
                            "You have no Notification yet"),
                      ));
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 350.0,
                    decoration: BoxDecoration(color: primaryColor),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello Sipasian !',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.0, left: 25.0, right: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 370.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 15.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.purple.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.map),
                                      color: Colors.purple,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return MapsPage();
                                        }));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Maps',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.green.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.list),
                                      color: Colors.green,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            child: new AlertDialog(
                                              title: new Text('Parking List'),
                                              content: new Text(
                                                  'This Feature will be add soon :D'),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Parking List',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.orange.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.warning),
                                      color: Colors.orangeAccent,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return BugReport();
                                        }));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Bug Report',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.red.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.help),
                                      color: Colors.red,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            child: new AlertDialog(
                                              title:
                                                  new Text('Need some Help?'),
                                              content: new Text("Don't Hesitate to Reach us at\nEmail: Sipassmart@gmail.com\nWhatsApp: +6285156837135"),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Help',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.brown.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.bookmark),
                                      color: Colors.brown,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            child: new AlertDialog(
                                              title: new Text('Book-a-Park'),
                                              content: new Text(
                                                  'This Feature will be add soon :D'),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('Book-A-Park',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Material(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.blueGrey.withOpacity(0.1),
                                    child: IconButton(
                                      padding: EdgeInsets.all(15.0),
                                      icon: Icon(Icons.announcement),
                                      color: Colors.blueGrey,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            child: new AlertDialog(
                                              title: new Text('About Us'),
                                              content: new Text(
                                                  'SIPAS (Smart City Parking System) is an application that providing available parking space nearby your location. Currently is only available in Bandung, Indonesia. To see available parking space, press "maps" icon you can use search bar for looking parking space nearby'),
                                            ));
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text('About Us',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
