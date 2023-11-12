class AuthResponse {
  final int id;
  final String token;
  final String refreshToken;

  AuthResponse({
    required this.id,
    required this.token,
    required this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      id: json['user_id'],
      token: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
