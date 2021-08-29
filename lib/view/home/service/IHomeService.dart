import '../model/add_user_model.dart';
import '../model/detail_model.dart';
import '../model/home_model.dart';

abstract class IHomeService {
  Future<HomeModel?> getUsers();
  Future<AddUserModel?> addUser(String userId);
  Future<DetailModel?> userDetail(String id);
}
