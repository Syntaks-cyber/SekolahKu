
import 'package:sekolahku/domain/student_domain.dart';
import 'package:sekolahku/repository/pelajar_repository.dart';

class PelajarService {
  final PelajarRepository pelajarRepository;

  PelajarService(this.pelajarRepository);

  Future<int> createStudents(StudentDomain studentDomain){
    return pelajarRepository.create(studentDomain);
  }

  Future<void> deleteStudent(int index){
    return pelajarRepository.delete(index);
  }

  Future<List<StudentDomain>> readStudents(String keyword){
    return pelajarRepository.readStudents(keyword);
  }

  Future<StudentDomain> studentById(int index){
    return pelajarRepository.studentById(index);
  }

  Future<int> updateStudent(int id, StudentDomain studentDomain){
    return pelajarRepository.updateStudent(id, studentDomain);
  }
}