import 'package:flutter/material.dart';
import 'package:sekolahku/screens/edit_screen.dart';
import 'package:sekolahku/screens/home_screen.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return CheckState();
  }
}

class CheckState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //untuk menghilangkan showdebug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Siswa"),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage(),
                ),);
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.indigo.shade900,
            actions: <Widget>[
              IconButton(icon: new Icon(Icons.edit, color: Colors.white), onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditPage(),
                  ),);
              },),
              IconButton(icon: new Icon(Icons.delete, color: Colors.white), onPressed: () {  },),
            ],
        ),
        body: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              imageProfile(),
            ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Jhon Wick"),
            subtitle: Text("Nama"),
            ),
            ListTile(
            leading: Icon(Icons.phone),
            title: Text("91236778"),
            subtitle: Text("No. Hp"),
            ),
            ListTile(
            leading: Icon(Icons.label),
            title: Text("Pria"),
            subtitle: Text("Jenis Kelamin"),
            ),
            ListTile(
            leading: Icon(Icons.school),
            title: Text("SMA"),
            subtitle: Text("Jenjang"),
            ),
            ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Hollywood"),
            subtitle: Text("Alamat"),
          ),
      ],
    ),
    ),
    );
  }
}

Widget imageProfile() {
  return Center(
    child: Stack(children: <Widget>[
      CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage("assets/pria.png"),
      ),
      Positioned(
        bottom: 10.0,
        right: 20.0,
        child: Icon(
          Icons.camera_alt,
          color: Colors.teal,
          size: 28.0,
        )
      ),
    ],
  ),
  );
}

