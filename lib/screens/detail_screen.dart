

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/domain/student_domain.dart';
import 'package:sekolahku/screens/add_screen.dart';
import 'package:sekolahku/services/app_services.dart';

class DetailPage extends StatefulWidget{
  final int id;
  const DetailPage({Key key, this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();

}

class _DetailPageState extends State<DetailPage>{
  StudentDomain _studentDomain;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text('Detail Siswa'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => FormPage(
                  title: 'Edit Siswa',
                  isEdit: true,
                  studentDomain: _studentDomain,
                ),
              ),
              ).then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.create),
          ),
          IconButton(
            onPressed:(){
              AppServices.getPelajarService.deleteStudent(widget.id).then((value) {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: FutureBuilder(
        future: AppServices.getPelajarService.studentById(widget.id),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null){
            return CircularProgressIndicator();
          }

          _studentDomain = snapshot.data;

          return ListView(
            children: [
              SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      _studentDomain.gender == 'Pria'
                          ? "assets/pria.png"
                          : "assets/wanita.png",
                      height: 150,
                      width: 150
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.perm_contact_cal),
                title: Text(_studentDomain.fullName),
                subtitle: Text("Nama"),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(_studentDomain.mobilePhone),
                subtitle: Text("No. Hp"),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text(_studentDomain.gender),
                subtitle: Text("Jenis Kelamin"),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(_studentDomain.grade),
                subtitle: Text("Jenjang"),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(_studentDomain.address),
                subtitle: Text("Alamat"),
              )
            ],
          );
        },
      ),
    );
  }
}