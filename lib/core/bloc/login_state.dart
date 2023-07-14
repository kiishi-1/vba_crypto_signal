part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class RequestingLogin extends LoginState {}

class LoginSuccessful extends LoginState {
  final String message;
  final String title;
  const LoginSuccessful({
    required this.message,
    required this.title
  });
}

class LoginFailed extends LoginState {
  final Failure error;
  const LoginFailed({required this.error});
}
