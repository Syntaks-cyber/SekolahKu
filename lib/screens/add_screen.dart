import 'package:flutter/material.dart';
import 'package:sekolahku/custom/CheckB.dart';
import 'package:sekolahku/custom/Cradio.dart';
import 'package:sekolahku/domain/student_domain.dart';
import 'package:sekolahku/services/app_services.dart';
import 'package:sekolahku/utils/capitalize.dart';

class FormPage extends StatefulWidget {
  final String title;
  final bool isEdit;
  final StudentDomain studentDomain;

  const FormPage({Key key, @required this.title, this.isEdit, this.studentDomain}) : super(key : key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobilePhoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String gender;
  String grade;
  List<String> valueHobbies = <String>[];

  @override
  void initState(){
    super.initState();
    if(widget.isEdit){
      firstNameController.text = widget.studentDomain.firstName;
      lastNameController.text = widget.studentDomain.lastName;
      mobilePhoneController.text = widget.studentDomain.mobilePhone;
      addressController.text = widget.studentDomain.address;
      gender = widget.studentDomain.gender;
      grade = widget.studentDomain.grade;
      valueHobbies = widget.studentDomain.hobbies;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: Text('Buat Siswa'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: firstNameController,
                    validator: (value){
                      if(value.isEmpty){
                        return "Tidak Boleh Kosong";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Nama Depan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: lastNameController,
                    validator: (value){
                      if(value.isEmpty){
                        return "Tidak Boleh Kosong";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Nama Belakang',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: mobilePhoneController,
              validator: (value){
                if(value.isEmpty){
                  return "Tidak Boleh Kosong";
                }else{
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: 'No. Hp',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            Text(
              'Jenis Kelamin',
              style: TextStyle(color: Colors.blue),
            ),
            Row(
              children: StudentDomain.genders.map((e) => CustomRadio(
                value: e,
                groupValue: gender,
                label: capitalize(e),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                activeColor: Colors.orangeAccent,
              ))
                  .toList(),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              items: StudentDomain.grades.map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList(),
              value: grade,
              onChanged: (value){
                setState(() {
                  grade = value;
                });
              },
              isExpanded: true,
              hint: Text("Pilih Jenjang"),
            ),
            SizedBox(height: 10),
            Text('Hobi', style: TextStyle(color: Colors.blue)),
            Column(
              children: StudentDomain.hobbyList.map((e) => CustomCheckBox(
                text: e,
                value: valueHobbies.contains(e),
                onChanged: (value){
                  setState(() {
                    if(valueHobbies.contains(e)){
                      valueHobbies.remove(e);
                    }else{
                      valueHobbies.add(e);
                    }
                  });
                },
                activeColor: Colors.orangeAccent,
              ))
                  .toList(),
            ),
            SizedBox(height: 10),
            Text('Alamat', style: TextStyle(color: Colors.blue)),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: addressController,
              validator: (value){
                if(value.isEmpty){
                  return "Tidak Boleh Kosong";
                } else {
                  return null;
                }
              },
              maxLines: 5,
              decoration: InputDecoration(
                  hintText:  "Alamat",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_formkey.currentState.validate()){
            StudentDomain studentDomain = StudentDomain();
            studentDomain.address = addressController.text.trim();
            studentDomain.hobbies = valueHobbies;
            studentDomain.grade = grade;
            studentDomain.gender = gender;
            studentDomain.hobbies = valueHobbies;
            studentDomain.mobilePhone = mobilePhoneController.text.trim();
            studentDomain.lastName = lastNameController.text.trim();
            studentDomain.firstName = firstNameController.text.trim();

            if(widget.isEdit){
              AppServices.getPelajarService.updateStudent(widget.studentDomain.idStudent, studentDomain)
                  .then((value){
                Navigator.pop(context);
              }).catchError((error){
              });
            }else{
              AppServices.getPelajarService.createStudents(studentDomain).then((value) {
                Navigator.pop(context);
              }).catchError((error){
                print(error);
              });
            }
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan Isi")));
          }
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}