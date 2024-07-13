import 'package:bloc_clean_architecture/src/comman/api.dart';
import 'package:bloc_clean_architecture/src/comman/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> login(String email, String password);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<void> login(String email, String password) async {
    try {
    final prefs = await SharedPreferences.getInstance();
     final response = await dio.post(API.LOGIN, data: {
        'email': email,
        'password': password,
      });
      final token = response.data['token'].toString();
      await prefs.setString(ACCESS_TOKEN, token);
    } catch (e) {
      rethrow;
    }
  }
}
