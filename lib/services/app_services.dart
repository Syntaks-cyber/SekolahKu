import 'package:sekolahku/model/pelajar_provider.dart';
import 'package:sekolahku/repository/login_repository.dart';
import 'package:sekolahku/repository/pelajar_repository.dart';
import 'package:sekolahku/services/login_services.dart';
import 'package:sekolahku/services/pelajar_services.dart';
import 'package:sqflite/sqlite_api.dart';

PelajarRepository pelajarRepository = PelajarRepository(StudentModelProvider.getInstance());
//GuruRepository guruRepository = GuruRepository(StudentModelProvider.getInstance());
LoginRepository loginRepository = LoginRepository(StudentModelProvider.getInstance());
PelajarService pelajarService = PelajarService(pelajarRepository);
//GuruService guruService = GuruService(guruRepository);
LoginService loginService = LoginService(loginRepository);

class AppServices {
  static PelajarService get getPelajarService {
    return pelajarService;
  }

  static Future<Database> openDb() {
    return StudentModelProvider.getInstance().openDb();
  }

  static Future<Database> closeDb() {
    return StudentModelProvider.getInstance().closeDb();
  }

//static GuruService get getGuruService{
// return guruService;
// }

//static GuruService get getLoginService{
// return loginService;
// }
}