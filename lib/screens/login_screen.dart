import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/screens/home_screen.dart';
import 'package:sekolahku/screens/register_screen.dart';
import 'package:sekolahku/services/app_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username;
  String password;
  bool _isHidePassword = true;

  void _togglePasswordVisibility(){
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'sekolah',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/sekolah.png'),
      ),
    );

    return new Scaffold(
        body: Container(
            padding: EdgeInsets.all(25.0),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 45.0,
                    ),
                    logo,
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      obscureText: _isHidePassword,
                      autofocus: false,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePasswordVisibility();
                            },
                            child: Icon(
                              _isHidePassword ? Icons.visibility_off : Icons.visibility,
                              color: _isHidePassword ? Colors.grey : Colors.blue ,
                            ) ,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)
                          )
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Background color
                        ),
                        onPressed: (){
                          onLoginPressed();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:0.0, bottom:20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(pageBuilder:
                                (BuildContext context, _, __) => RegisterPage()));
                          },
                          child: Text(
                              'Buat Akun ?', style: TextStyle(color: Colors.orangeAccent, fontSize: 15)),
                        )
                    ),
                  ],
                )
            )
        )
    );
  }

  void onLoginPressed(){
    if(usernameController.text!=null){
      if(passwordController.text!=null){
        username = usernameController.text.toString();
        password = passwordController.text.toString();

        AppServices.getLoginService.getUsername(username).then((value){
          if(value!=null){
            AppServices.getLoginService
                .getLogin(username, password)
                .then((valueLogin){
              if(valueLogin!=null){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Password Salah')));
              }
            }).catchError((error){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Login Gagal, Periksa User Anda Dengan Benar')));
            }
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Akun Belum Terdaftar')));
          }
        }).catchError((error){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Login Gagal, Periksa User Anda Dengan Benar')));
        });
      }else{
        print("Masukan Password");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Anda Belum Mengisi Password')));
      }
    }else{
      print("Masukan Username");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Anda Belum Mengisi Username')));
    }
  }
}