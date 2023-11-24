part of 'sing_in_bloc.dart';

sealed class SingInEvent extends Equatable {
  const SingInEvent();

  @override
  List<Object> get props => [];
}

final class PhoneChanged extends SingInEvent {
  final String phone;

  const PhoneChanged({required this.phone});
}

final class ChangePage extends SingInEvent {
  final SingInPage page;

  const ChangePage({required this.page});
}

final class IdentificatePhone extends SingInEvent {}

final class Authentication extends SingInEvent {
  final String inputCode;

  const Authentication({required this.inputCode});
}

final class InputCodeChanged extends SingInEvent {
  final String newCode;

  const InputCodeChanged({required this.newCode});
}
