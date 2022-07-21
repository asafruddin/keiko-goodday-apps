part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.isLogingIn = false,
      this.loginEntity,
      this.failure,
      this.isLoginSuccess = false});

  final bool? isLogingIn;
  final bool? isLoginSuccess;
  final Failure? failure;
  final LoginEntity? loginEntity;

  LoginState copyWith(
      {bool? isLogingIn,
      Failure? failure,
      LoginEntity? loginEntity,
      bool? isLoginSuccess}) {
    return LoginState(
        failure: failure ?? this.failure,
        isLogingIn: isLogingIn ?? this.isLogingIn,
        loginEntity: loginEntity ?? this.loginEntity,
        isLoginSuccess: isLoginSuccess ?? isLoginSuccess);
  }

  @override
  List<Object?> get props => [isLogingIn, loginEntity, failure];
}

class LoginInitial extends LoginState {}
