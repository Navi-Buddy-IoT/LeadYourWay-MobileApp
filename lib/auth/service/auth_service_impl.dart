import 'package:dio/dio.dart';
import 'package:lead_your_way/config/constants/enviornment.dart';
import 'package:lead_your_way/shared/errors/error_controller.dart';
import 'package:lead_your_way/shared/models/auth_response.dart';
import 'package:lead_your_way/auth/service/auth_service.dart';

class AuthServiceImpl extends AuthService {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login',
          data: {'userEmail': email, 'userPassword': password});
      final userResponse = AuthResponse.fromJson(response.data);
      return userResponse;
    } on DioException catch (e) {
      if ((e.response?.statusCode == 500)) throw WrongCredentials();
      if ((e.type == DioExceptionType.connectionTimeout)) {
        throw ConnectioTimeOut();
      }

      throw CustomError(message: 'Something wrong happend', errorCode: 500);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<AuthResponse> register(String fullName, String email, String password,
      String confirmPassword) async {
    try {
      final names = fullName.split(' ');
      final firstName = names.first;
      final lastName = names.length > 1 ? names.sublist(1).join(' ') : '';

      final response = await dio.post('/auth/register', data: {
        'userFirstName': firstName,
        'userLastName': lastName,
        'userEmail': email,
        'userPassword': password,
        'userPhone': "123456789",
        'userBirthDate': "2000-01-01",
        'latitudeData': 35.6636112226532,
        'longitudeData': 139.73213989556533,
        'imageData':
            "https://img2.freepng.es/20180512/blq/kisspng-computer-icons-facebook-clip-art-5af6a585736d81.2327961215261136694728.jpg",
      });
      final userResponse = AuthResponse.fromJson(response.data);
      return userResponse;
    } catch (e) {
      throw Exception();
    }
  }
}
