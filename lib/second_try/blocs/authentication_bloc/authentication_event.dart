part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class StartAuthenticationEvent extends AuthenticationEvent {}

final class PhoneChangedEvent extends AuthenticationEvent {
  final String phone;

  const PhoneChangedEvent({required this.phone});
}

final class CodeForCheckChangedEvent extends AuthenticationEvent {
  final String code;

  const CodeForCheckChangedEvent({required this.code});
}

final class GetCodeEvent extends AuthenticationEvent {}

final class GetTokenEvent extends AuthenticationEvent {}

final class ResetEvent extends AuthenticationEvent {}
