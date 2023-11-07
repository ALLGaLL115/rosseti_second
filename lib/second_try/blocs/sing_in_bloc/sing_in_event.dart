part of 'sing_in_bloc.dart';

sealed class SingInEvent extends Equatable {
  const SingInEvent();

  @override
  List<Object> get props => [];
}

final class FetchTokenEvent extends SingInEvent {
  final String code;
  final String phone;

  const FetchTokenEvent({required this.phone, required this.code});
}

final class OpenSecondEvent extends SingInEvent {}

final class FetchCodeEvent extends SingInEvent {
  final String phone;

  const FetchCodeEvent({required this.phone});
}
