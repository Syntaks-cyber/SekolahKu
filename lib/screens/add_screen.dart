import 'package:flutter/material.dart';
import 'package:sekolahku/screens/detail_screen.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return CheckState();
  }
}

class CheckState extends State<AddPage> {
  TextEditingController textarea = TextEditingController();
  int _valueb=0;
  String? _value;
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
          onPressed: () {
            Navigator.push(
            context,MaterialPageRoute(
                builder: (context) => DetailPage(),
            ),
            );
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
                child: ListTile(
                  subtitle: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'Nama Depan',
                    ),
                  ),),
              ),
              Expanded(
                child:ListTile(
                  subtitle:  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: 'Nama Belakang',
                    ),
                  ),),
              ),
            ],
          ),
            SizedBox(
              height: 8,
            ),
            ListTile(
            subtitle: TextFormField(
              decoration: const InputDecoration(
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: 'No. Hp',
              ),
            ),
          ),
            SizedBox(
              height: 8,
            ),
          Container(
            padding: EdgeInsets.only(left: 19),
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
                      _valueb=value!;
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
                        _valueb=value!;
                      });
                    }),
              ),
            ),
          ],
            ),
          ],
           ),),
          Container(
          padding: EdgeInsets.only(left: 19),
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
              padding: EdgeInsets.only(left: 19),
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
          padding: EdgeInsets.only(left: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alamat',
                style: TextStyle(
                    color: Color(0xffff9100), fontSize: 17),),
              SizedBox(
                height: 8,
              ),
            TextField(
              //controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Alamat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
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

  CheckBoxHobi({required this.title, this.value=false});
}



