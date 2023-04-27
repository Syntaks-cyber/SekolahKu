import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/domain/student_domain.dart';
import 'package:sekolahku/screens/add_screen.dart';
import 'package:sekolahku/screens/detail_screen.dart';
import 'package:sekolahku/services/app_services.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  List<StudentDomain> _listStudent = <StudentDomain>[];
  String _valuekeyword = '';
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: _isSearch
            ? TextField(
          decoration: InputDecoration(
            hintText: 'Cari Siswa...',
            fillColor: Colors.white,
            filled: true,
          ),
          autofocus: true,
          onSubmitted: (value){
            setState(() {
              _valuekeyword = value;
            });
          },
        )
            : Text('SekolahKu'),
        actions: [
          IconButton(
              icon: _isSearch ? Icon(Icons.close) : Icon(Icons.search),
              onPressed: (){
                if(_isSearch){
                  setState(() {
                    _valuekeyword = '';
                    _isSearch = false;
                  });
                }else{
                  setState(() {
                    _valuekeyword = '';
                    _isSearch = true;
                  });
                }
              })
        ],
      ),
      body: FutureBuilder<List<StudentDomain>>(
        initialData: _listStudent,
        future: AppServices.getPelajarService.readStudents(_valuekeyword),
        builder: (context, snapshot) {
          if ((snapshot.connectionState == ConnectionState.none && snapshot.hasData == null) ||
              snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          } else if (snapshot.hasData && snapshot.data.length > 0){
            _listStudent = snapshot.data;
          }

          return ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(
                      id: _listStudent[index].idStudent,
                    ),
                    ),
                  ).then((value) {
                    setState(() {
                    });
                  });
                },
                leading: Image.asset(_listStudent[index].gender == 'Pria'
                    ? 'assets/pria.png'
                    : 'assets/wanita.png'),
                title: Text(_listStudent[index].fullName),
                subtitle: Text(_listStudent[index].gender),
                trailing: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(_listStudent[index].grade.toUpperCase()),
                    Text(_listStudent[index].mobilePhone)
                  ],
                ),
              );
            },
            separatorBuilder: (context, index){
              return Divider(
                color: Colors.black26,
              );
            },
            itemCount: _listStudent.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.orangeAccent,
        onPressed: (){
          print('Length Siswa: ${_listStudent.length}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(title: 'Buat Siswa', isEdit: false),
            ),
          ).then((value) {
            setState(() {
            });
          });
        },
      ),
    );
  }
}