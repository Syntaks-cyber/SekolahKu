import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/domain/login_domain.dart';
import 'package:sekolahku/services/app_services.dart';

class RegisterPage extends StatefulWidget {
  final LoginDomain loginDomain;

  const RegisterPage({Key key, this.loginDomain}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
      child:
      CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/sekolah.png'),
      ),
    );

    return new Scaffold(
        body: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
                padding: EdgeInsets.all(25.0),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: logo,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text('Username',
                            style: TextStyle(
                                color: Color(0xffff9100), fontSize: 17)),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: usernameController,
                          validator: (value){
                            if(value.isEmpty){
                              return "Tidak Boleh Kosong";
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)
                              )
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text('Password',
                          style: TextStyle(
                              color: Color(0xffff9100), fontSize: 17),),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          obscureText: _isHidePassword,
                          autofocus: false,
                          controller: passwordController,
                          validator: (value){
                            if(value.isEmpty){
                              return "Tidak Boleh Kosong";
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
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
                              if(_formkey.currentState.validate()){
                                LoginDomain loginDomain = LoginDomain();
                                loginDomain.username = usernameController.text.trim();
                                loginDomain.password = passwordController.text.trim();

                                AppServices.getLoginService.getUsername(username).then((value){
                                  if(value==null){
                                    AppServices.getLoginService.createLogin(loginDomain).then((value) {
                                      Navigator.pop(context);
                                    }).catchError((error){
                                      print(error);
                                    });
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan Isi")));
                                  }
                                });
                              };
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'BUAT AKUN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )
            )
        )
    );
  }
}