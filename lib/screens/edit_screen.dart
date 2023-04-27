import 'package:flutter/material.dart';
import 'package:sekolahku/screens/detail_screen.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return CheckState();
  }
}

class CheckState extends State<EditPage> {
  final _usernamadepanController = TextEditingController();
  final _usernamabelakangController = TextEditingController();
  final _userkontakController = TextEditingController();
  final _useralamatController = TextEditingController();
  bool _validatenamadepan = false;
  bool _validatenamabelakang = false;
  bool _validatekontak = false;
  bool _validatealamat = false;

  TextEditingController textarea = TextEditingController();
  int _valueb=0;
  String _value;
  final allChecked = CheckBoxHobi(title: 'Semua');
  final checkBoxList = [
    CheckBoxHobi(title: 'Membaca'),
    CheckBoxHobi(title: 'Menulis'),
    CheckBoxHobi(title: 'Menggambar')
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //untuk menghilangkan showdebug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              _usernamadepanController.text.isEmpty
                  ? _validatenamadepan = true : _validatenamadepan = false;
              _usernamabelakangController.text.isEmpty
                  ? _validatenamabelakang = true : _validatenamabelakang =
              false;
              _userkontakController.text.isEmpty
                  ? _validatekontak = true : _validatekontak = false;
              _useralamatController.text.isEmpty
                  ? _validatealamat = true : _validatealamat = false;
            });
            if (_validatenamadepan == false &&
                _validatenamabelakang == false &&
                _validatekontak == false &&
                _validatealamat == false) {
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => DetailPage(),
              ),
              );
            }
          },
          child: Icon(Icons.save, size: 30),
          backgroundColor: Colors.orangeAccent,
        ),
        appBar: AppBar(
          title: Text("Buat Siswa"),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.indigo.shade900,
          //Warna background App Bar
        ),
        body: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child:Container(
                      margin: EdgeInsets.only(top: 5,left: 15,right:8),
                      child: TextFormField(
                        controller: _usernamadepanController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          hintText: 'Nama Depan',
                          labelText: 'Nama Depan',
                          errorText:
                          _validatenamadepan ? 'Nama Depan Tidak Boleh Kosong' : null,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:Container(
                      margin: EdgeInsets.only(top: 5,right: 15),
                      child: TextFormField(
                        controller: _usernamabelakangController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          hintText: 'Nama Belakang',
                          labelText: 'Nama Belakang',
                          errorText:
                          _validatenamabelakang ? 'Nama Belakang Tidak Boleh Kosong' : null,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                subtitle: TextFormField(
                  controller: _userkontakController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'No. Hp',
                    labelText: 'Kontak',
                    errorText: _validatekontak ?
                    'Kontak Tidak Boleh Kosong' : null,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jenis Kelamin",
                      style: TextStyle(
                          color: Color(0xffff9100),
                          fontSize: 17),),
                    Row(
                      children: [
                        Expanded(
                          child:ListTile(
                            title: const Text('Pria'),
                            leading: Radio(
                                value: 1,
                                groupValue: _valueb,
                                activeColor: Color(0xffff9100),
                                onChanged: (value) {
                                  setState((){
                                    _valueb=value;
                                  }
                                  );
                                }),
                          ),
                        ),
                        Expanded(
                          child:ListTile(
                            title: const Text('Wanita'),
                            leading: Radio(
                                value: 2,
                                groupValue: _valueb,
                                activeColor: Color(0xffff9100),
                                onChanged: (value) {
                                  setState((){
                                    _valueb=value;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),),
              Container(
                padding: EdgeInsets.only(left: 18, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField(
                      iconSize: 20,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      onChanged: (s) {},
                      hint: Text('Pilih Jenjang'),
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('SD'),
                          value: 'one',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('SMP'),
                          value: 'two',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('SMA'),
                          value: 'three',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('S1'),
                          value: 'four',
                        ),
                      ],
                      //   onChanged: (String? value) {
                      //   setState(() {
                      //    _value = value;
                      //  });
                      // },
                      //  hint: Text('Pilih Jenjang'),
                      //value: _value,
                    ),],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hobi',
                      style: TextStyle(
                          color: Color(0xffff9100),fontSize: 17),),
                    ListTile(
                      onTap: () => onAllClicked(allChecked),
                      leading: Checkbox(
                        value: allChecked.value,
                        onChanged: (value) => onAllClicked(allChecked),
                      ),
                      title: Text(allChecked.title, style: TextStyle(
                          fontSize: 15
                      )),
                    ),
                    Divider(),
                    ...checkBoxList.map((item) =>
                        ListTile(
                          onTap: () => onItemClicked(item),
                          leading: Checkbox(
                            value: item.value,
                            activeColor: Colors.orangeAccent,
                            onChanged: (value) => onItemClicked(item),
                          ),
                          title: Text(item.title, style: TextStyle(
                              fontSize: 15
                          )),
                        )
                    ).toList()
                  ],),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 18, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alamat',
                      style: TextStyle(
                          color: Color(0xffff9100), fontSize: 17),),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      //controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        controller: _useralamatController,
                        decoration: InputDecoration(
                          hintText: "Alamat",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          labelText: 'Alamat',
                          errorText: _validatealamat ?
                          'Alamat Tidak Boleh Kosong' : null,
                        )
                    ),
                  ],
                ),
              ),
            ],),
        ),
      ),
    );
  }

  onAllClicked(CheckBoxHobi ckbItem){
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element){
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxHobi ckbItem){
    setState(() {
      ckbItem.value = !ckbItem.value;
    });
  }
}

class CheckBoxHobi {
  String title;
  bool value;

  CheckBoxHobi({this.title, this.value=false});
}



