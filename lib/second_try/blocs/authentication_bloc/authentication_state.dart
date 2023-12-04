part of 'authentication_bloc.dart';

enum GetCodeStatus { initial, loading, success, error }

enum GetTokenStatus { initial, loading, success, error }

enum AuthenticationPage { inital, phone, sms }

class AuthenticationState extends Equatable {
  final GetCodeStatus codeStatus;
  final GetTokenStatus tokenStatus;
  final AuthenticationPage authenticationPage;
  final String codeTruth;
  final String phone;
  bool get phoneIsValid => phone.length > 8;
  final String codeForCheck;
  get codeIsValid => codeTruth == codeForCheck;

  const AuthenticationState({
    required this.codeStatus,
    required this.tokenStatus,
    required this.authenticationPage,
    required this.codeTruth,
    required this.phone,
    required this.codeForCheck,
  });

  copyWith({
    GetCodeStatus? codeStatus,
    GetTokenStatus? tokenStatus,
    AuthenticationPage? authenticationPage,
    String? codeTruth,
    String? phone,
    String? codeForCheck,
  }) =>
      AuthenticationState(
          codeStatus: codeStatus ?? this.codeStatus,
          tokenStatus: tokenStatus ?? this.tokenStatus,
          authenticationPage: authenticationPage ?? this.authenticationPage,
          codeTruth: codeTruth ?? this.codeTruth,
          phone: phone ?? this.phone,
          codeForCheck: codeForCheck ?? this.codeForCheck);

  @override
  // TODO: implement props
  List<Object?> get props => [
        codeStatus,
        tokenStatus,
        authenticationPage,
        codeTruth,
        phone,
        codeForCheck,
      ];
}
