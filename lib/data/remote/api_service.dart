import 'package:dio/dio.dart';
import 'package:nano_health_assesment/constant/string.dart';


class ApiService {
  late Dio dio;
  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);

  }

  Future<dynamic> logIn(String userName,String password) async {
    try {
      var response = await dio.post('auth/login',
        data: {"username": userName, "password": password},);
      return response.data['token'];
    } catch (e) {
      print(e.toString());
    }
  }
  Future<List<dynamic>> getProducts() async {
    try {
      var response = await dio.get('products');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}