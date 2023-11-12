import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lead_your_way/auth/provider/auth_provider.dart';

class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final String email;
  final String password;

  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = '',
    this.password = '',
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    String? email,
    String? password,
  }) {
    return LoginFormState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return '''
      isPosting: $isPosting,
      isFormPosted: $isFormPosted,
      isValid: $isValid,
      email: $email,
      password: $password,
    ''';
  }
}

//! 2 - Como implementamos un notifier provider

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final Function(String, String) loginUserCallback;

  LoginFormNotifier({
    required this.loginUserCallback,
  }) : super(LoginFormState());

  onEmailChange(String value) {
    final newEmail = value;
    state = state.copyWith(
      isValid: _isValidEmail(newEmail) && _isValidPassword(state.password),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = value;
    state = state.copyWith(
      password: newPassword,
      isValid: _isValidEmail(state.email) && _isValidPassword(newPassword),
    );
  }

  Future<void> onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    try {
      await loginUserCallback(state.email, state.password);
    } finally {
      state = state.copyWith(isPosting: false);
    }
  }

  _touchEveryField() {
    final email = state.email;
    final password = state.password;
    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      isValid: _isValidEmail(email) && _isValidPassword(password),
    );
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegex.hasMatch(password);
  }
}

//! 3 - StateNotifierProvider - Consume afuera

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
  return LoginFormNotifier(loginUserCallback: loginUserCallback);
});
