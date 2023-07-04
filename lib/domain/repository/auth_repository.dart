
import 'package:nano_health_assesment/data/remote/api_service.dart';

class AuthRepository {
  late final ApiService apiService;

  Future<dynamic> login(String username,String password) async {
    apiService = ApiService();
    final auth = await apiService.logIn(username, password);
    return auth;
  }

}