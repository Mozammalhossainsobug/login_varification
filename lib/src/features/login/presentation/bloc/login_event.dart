part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  get email => null;

  get password => null;
}

class LoginSubmitEvent extends LoginEvent {
  const LoginSubmitEvent({
    required this.email,
    required this.password,
  });

  @override
  final String email;
  @override
  final String password;

  @override
  List<Object?> get props => [email, password];
}
