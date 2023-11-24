import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/providers/auth_providers.dart';

part 'sing_in_event.dart';
part 'sing_in_state.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  late AutheticatoinProviders _autheticatoinProviders;
  SingInBloc({required AutheticatoinProviders autheticatoinProviders})
      : _autheticatoinProviders = autheticatoinProviders,
        super(const SingInState(
            phone: '', code: '', page: SingInPage.first, inputCode: "")) {
    on<PhoneChanged>(
      (event, emit) {
        emit(state.copyWith(phone: event.phone));
      },
    );
    on<IdentificatePhone>(
      (event, emit) async {
        final code = await _autheticatoinProviders.getCode(state.phone);
        emit(state.copyWith(code: code, page: SingInPage.third));
      },
    );
    on<ChangePage>(
      (event, emit) {
        emit(state.copyWith(page: event.page));
      },
    );
    on<InputCodeChanged>(
      (event, emit) {
        emit(state.copyWith(inputCode: event.newCode));
      },
    );
    on<Authentication>(
      (event, emit) async {
        if (event.inputCode == state.code && event.inputCode != "") {
          final token = await _autheticatoinProviders.getToken(
              phone: state.phone, code: state.code);
          Boxes.getTokenBox().add("Bearer $token");
        }
      },
    );
  }
}
