abstract class AuthState {}

class AuthInitial extends AuthState {}

class ChangePasswordIconState extends AuthState {}
class LoginLoadingState extends AuthState {}
class LoginSucessfulltyState extends AuthState {
   final String message;

  LoginSucessfulltyState({required this.message});
}
class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState({required this.message});
}
class SignUpLoadingState extends AuthState {}
class SignUpSucessfulltyState extends AuthState {
   final String message;

  SignUpSucessfulltyState({required this.message});
}
class SignUpErrorState extends AuthState {
  final String message;

  SignUpErrorState({required this.message});
}
class ForgetPasswordLoadingState extends AuthState {}
class ForgetPasswordSucessfulltyState extends AuthState {
   final String message;

  ForgetPasswordSucessfulltyState({required this.message});
}
class ForgetPasswordErrorState extends AuthState {
  final String message;

  ForgetPasswordErrorState({required this.message});
}


class ChangeDepartmentValueState extends AuthState {}

