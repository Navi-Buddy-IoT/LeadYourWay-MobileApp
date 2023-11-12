import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lead_your_way/auth/service/auth_service.dart';
import 'package:lead_your_way/auth/service/auth_service_impl.dart';
import 'package:lead_your_way/shared/errors/error_controller.dart';
import 'package:lead_your_way/shared/models/auth_response.dart';
import 'package:lead_your_way/shared/services/key_value_storage_service.dart';
import 'package:lead_your_way/shared/services/key_value_storage_service_impl.dart';

//! 1 - Inicializamos el state
//Creas una clase para representar el estado de tu aplicación.

enum AuthStatus { checking, authenticated, notAunthenticated }

class AuthState {
  final AuthStatus authStatus;
  final AuthResponse? user;
  final String token;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.token = '',
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    AuthResponse? user,
    String? errorMessage,
    String? token,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        token: token ?? this.token,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

//! 2 - Crear un Notificador de Estado
//Creas una clase que extiende StateNotifier y toma tu estado como parámetro
//Esta clase contiene la lógica para cambiar el estado y notificar a los oyentes sobre los cambios.

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService authRepository;
  final KeyValueStorage keyValueStorageService;

  AuthNotifier(
      {required this.keyValueStorageService, required this.authRepository})
      : super(AuthState()) {
    checkToken();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);

      _setLoggedUsers(user);
    } on WrongCredentials {
      logOut('Credenciales no son correctas');
    } on ConnectioTimeOut {
      logOut('TimeOut');
    } catch (e) {
      logOut('Error no controlado');
    }
  }

  Future<void> registerUser(String fullName, String email, String password,
      String confirmPassword) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.register(
          fullName, email, password, confirmPassword);
      _setLoggedUsers(user);
    } on WrongCredentials {
      logOut('Credenciales ya existen');
    } on ConnectioTimeOut {
      logOut('TimeOut');
    } catch (e) {
      logOut('Error no controlado');
    }
  }

  Future<void> logOut([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    await keyValueStorageService.removeKey('userId');
    state = state.copyWith(
      authStatus: AuthStatus.notAunthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }

  void checkToken() async {
    final token = await keyValueStorageService.getValue<String>('token');

    if (token == null) {
      return logOut();
    } else {
      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        token: token,
      );
    }
  }

  void _setLoggedUsers(AuthResponse user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    await keyValueStorageService.setKeyValue('userId', user.id);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
      token: user.token,
    );
  }
}

//! Proporcionar el Notificador de Estado
//Usas un StateNotifierProvider para proporcionar tu notificador de estado a tu árbol de widgets

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final authRepository = AuthServiceImpl();
    final keyValueStorageService = KeyValueStorageImpl();
    return AuthNotifier(
        authRepository: authRepository,
        keyValueStorageService: keyValueStorageService);
  },
);
