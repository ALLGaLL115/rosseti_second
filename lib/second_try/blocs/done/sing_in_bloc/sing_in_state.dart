part of 'sing_in_bloc.dart';

enum SingInPage { first, second, third }

class SingInState extends Equatable {
  final String phone;
  final String code;
  final String inputCode;
  final SingInPage page;
  const SingInState(
      {required this.page,
      required this.inputCode,
      required this.phone,
      required this.code});

  copyWith({String? phone, String? code, SingInPage? page, String? inputCode}) {
    return SingInState(
        phone: phone ?? this.phone,
        code: code ?? this.code,
        page: page ?? this.page,
        inputCode: inputCode ?? this.inputCode);
  }

  @override
  List<Object> get props => [phone, code, inputCode, page];
}
