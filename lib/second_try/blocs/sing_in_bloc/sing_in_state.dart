part of 'sing_in_bloc.dart';

sealed class SingInState extends Equatable {
  const SingInState();

  @override
  get props => [];
}

class SingInLoading extends SingInState {}

class SingInInitial extends SingInState {}

class SinInSecondPage extends SingInState {}

class SingInCodeTaked extends SingInState {
  final String code;
  final String phone;
  const SingInCodeTaked({required this.code, required this.phone});
}

class SingInDone extends SingInState {
  final String token;

  const SingInDone({required this.token});

  @override
  get props => [token];
}

class SingInError extends SingInState {
  final String errorMessage;

  const SingInError(this.errorMessage);

  @override
  get props => [errorMessage];
}
