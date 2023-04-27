import 'package:sekolahku/repository/login_repository.dart';
import 'package:sekolahku/services/app_services.dart';
import 'package:sekolahku/domain/login_domain.dart';

class LoginService {
  final  LoginRepository loginRepository;

  LoginService(this.loginRepository);

  Future<int> createLogin(LoginDomain loginDomain){
    return loginRepository.create(loginDomain);
  }

  Future<LoginDomain> getUsername(String username){
    return loginRepository.getUsername(username);
  }

  Future<LoginDomain> getLogin(String username, String password){
    return loginRepository.getLogin(username, password);
  }
}