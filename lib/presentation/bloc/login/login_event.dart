part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnloginEvent extends LoginEvent {
  const OnloginEvent(this.body);

  final LoginBody? body;
}
