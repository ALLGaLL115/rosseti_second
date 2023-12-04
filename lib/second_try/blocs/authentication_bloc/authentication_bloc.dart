import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/repo/auth_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepo _authRepo;
  AuthenticationBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const AuthenticationState(
            codeStatus: GetCodeStatus.initial,
            tokenStatus: GetTokenStatus.initial,
            authenticationPage: AuthenticationPage.inital,
            codeTruth: "",
            phone: "",
            codeForCheck: "")) {
    on<StartAuthenticationEvent>(
      (event, emit) =>
          emit(state.copyWith(authenticationPage: AuthenticationPage.phone)),
    );
    on<PhoneChangedEvent>(
      (event, emit) {
        emit(state.copyWith(phone: event.phone));
      },
    );
    on<CodeForCheckChangedEvent>(
      (event, emit) {
        emit(state.copyWith(codeForCheck: event.code));
      },
    );
    on<GetCodeEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(codeStatus: GetCodeStatus.loading));
          final code = await _authRepo.getCode(phone: state.phone);
          emit(state.copyWith(
              codeTruth: code, codeStatus: GetCodeStatus.success));
          await Future.delayed(const Duration(milliseconds: 500));
          emit(state.copyWith(authenticationPage: AuthenticationPage.sms));
        } catch (e) {
          emit(state.copyWith(codeStatus: GetCodeStatus.error));
        }
      },
    );
    on<GetTokenEvent>(
      (event, emit) async {
        emit(state.copyWith(tokenStatus: GetTokenStatus.loading));
        try {
          final token = await _authRepo.getToken(
              phone: state.phone, code: state.codeTruth);
          await _authRepo.getTopics(token: token);

          emit(state.copyWith(tokenStatus: GetTokenStatus.success));
          Future.delayed(const Duration(milliseconds: 500));
          _authRepo.saveToken(token: token);
        } catch (e) {
          emit(state.copyWith(tokenStatus: GetTokenStatus.error));
        }
      },
    );
    on<ResetEvent>(
      (event, emit) {
        emit(state.copyWith(
            phone: '',
            codeForCheck: '',
            codeTruth: '',
            codeStatus: GetCodeStatus.initial,
            tokenStatus: GetTokenStatus.initial,
            authenticationPage:
                state.authenticationPage == AuthenticationPage.sms
                    ? AuthenticationPage.phone
                    : AuthenticationPage.inital));
      },
    );
  }
}
