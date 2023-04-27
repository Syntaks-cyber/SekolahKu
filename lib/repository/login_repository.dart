import 'package:sekolahku/domain/login_domain.dart';
import 'package:sekolahku/model/pelajar_provider.dart';

class LoginRepository{
  final StudentModelProvider _studentModelProvider;
  LoginRepository(this._studentModelProvider);

  Future<int> create(LoginDomain loginDomain){
    return _studentModelProvider
        .getDatabase()
        .then((value) => value.insert('login', loginDomain.toMap())
    );
  }

  Future<LoginDomain> getUsername(String username){
    var sqlRaw = '''
      SELECT * FROM login
      WHERE username = '$username'
      ''';
    return _studentModelProvider
        .getDatabase()
        .then((value) => value.rawQuery(sqlRaw))
        .then((data){
      if (data.length == 1){
        LoginDomain loginDomain = LoginDomain();
        loginDomain.fromMap(data[0]);
        return loginDomain;
      }
      return null;
    }
    );
  }

  Future<LoginDomain> getLogin(String username, String password){
    var sqlRaw = '''
      SELECT * FROM login
      WHERE username = '$username' AND
      password = '$password'
      ''';
    return _studentModelProvider
        .getDatabase()
        .then((value) => value.rawQuery(sqlRaw))
        .then((data){
      if (data.length == 1){
        LoginDomain loginDomain = LoginDomain();
        loginDomain.fromMap(data[0]);
        return loginDomain;
      }
      return null;
    }
    );
  }
}