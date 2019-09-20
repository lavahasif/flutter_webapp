import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget main_image = Container(
      margin: EdgeInsets.all(16),
      child: Image.asset("images/lake.jpg"),
    );
    Widget titleselection = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "I am first iam happy",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "I am Second iam happy",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Favorite(),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
    List<bool> value = new List();
    value.add(true);
    value.add(true);
    value.add(true);

    Widget buttons = Center(
      child: Container(
//        width: 25,
//        margin: EdgeInsets.symmetric(horizontal: 10),
//        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButtons(
              focusColor: Colors.blueGrey,
              onPressed: null,
              color: Colors.blue,
              hoverColor: Colors.blue.shade300,
              isSelected: value,
              children: <Widget>[
//                RaisedButton(child: Text("hello"),),
                _buildbutton(Colors.red, "CALL", Icons.call),
                _buildbutton(null, "ROUTE", Icons.send),
                _buildbutton(Colors.green, "SHARE", Icons.share),
              ],
            ),
          ],
        ),
      ),
    );
    Widget final_content = Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Center(
        child: Text(
            "An alternate implementation might have exported the highlight state to the parent while keeping the active state internal, but if you asked someone to use that tap box, they’d probably complain that it doesn’t make much sense. The developer cares whether the box is active. The developer probably doesn’t care how the highlighting is managed, and prefers that the tap box handles those details."),
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Intro"),
          backgroundColor: Colors.red.shade700,
        ),
        body: ListView(
          children: <Widget>[
            main_image,
            titleselection,
            buttons,
            final_content
          ],
        ),
      ),
    );
  }

  Widget _buildbutton(MaterialColor colors, String title, IconData icons) {
    return Container(
      width: 55,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(

        child: Column(
      children: <Widget>[
      Icon(
      icons != null ? icons : Icons.call,
        color: Colors != null ? colors : Colors.blue.shade300,
      ),
      Text(
        title,
        style: TextStyle(
            color: Colors != null ? colors : Colors.blue.shade300,
            fontSize: 11),
      )
      ],
    ),)
    ,
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _createstate createState() => _createstate();
}

class _createstate extends State<Favorite> {
  var _isfavorite = true;
  int _iscount = 41;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: _togglefavorite,
            icon: _isfavorite
                ? Icon(
              Icons.star,
              size: 25,
            )
                : Icon(
              Icons.star_border,
              size: 25,
            ),
            color: Colors.red,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "$_iscount",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  void _togglefavorite() {
    setState(() {
      if (_isfavorite) {
        _iscount -= 1;
        _isfavorite = false;
      } else {
        _iscount += 1;
        _isfavorite = true;
      }
    });
  }
}
