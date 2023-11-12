import 'package:lead_your_way/shared/models/auth_response.dart';

abstract class AuthService {
  Future<AuthResponse> login(
    String email,
    String password,
  );
  Future<AuthResponse> register(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  );
}
