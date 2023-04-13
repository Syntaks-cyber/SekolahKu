import 'package:flutter/material.dart';
import 'package:sekolahku/screens/add_screen.dart';
import 'package:sekolahku/screens/detail_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //untuk menghilangkan showdebug
      //title: 'List Tile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddPage(),
            ),);
          },
          child: Icon(Icons.add, size: 30),
          backgroundColor: Colors.orangeAccent,
        ),
        appBar: AppBar(
          title: Text("SekolahKu"),
          backgroundColor: Colors.indigo.shade900,
          actions: <Widget>[
            IconButton(icon: new Icon(Icons.search, color: Colors.white), onPressed: () {  },),
          ],//Warna background App Bar
        ),
        body: ListView( //Widget ListView
          children: [
            ListTile(  //Widget ListTile
              contentPadding: EdgeInsets.all(10), //ruang space disekitar elemen atau konten atau menambah jarak
              title: Text(
                "Jhon Lenon",
                maxLines: 2, // banyaknya paragraf tulisan yang ditampilkan pada teks list
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                  "Pria"),
              leading: Image.asset('assets/pria.png'), //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMA"),Text("234667126")
                ],
              ),
            ),
            Divider( // Memberikan Garis
              color: Colors.black, // Warna pada garis
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Jane Swift",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Wanita"),
              leading: Image.asset('assets/wanita.png'), //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMP"),Text("4234234")
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Jhon Wick",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Pria"),
              leading: Image.asset('assets/pria.png'), //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMA"),Text("91236778")
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(),
                  ),
                );
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Siti Halimah",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Wanita"),
              leading: Image.asset('assets/wanita.png'), //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMP"),Text("8365632")
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Taylor Chen",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Wanita"),
              leading: Image.asset('assets/wanita.png'), //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMA"),Text("78556262")
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Brad Pit",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Pria"),
              leading: Image.asset('assets/pria.png'), //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMA"),Text("3242372551")
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Jhon Care",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("Pria"),
              leading: Image.asset('assets/pria.png'),  //awalan pada circle image
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("SMA"),Text("3242323251")
                ],
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}