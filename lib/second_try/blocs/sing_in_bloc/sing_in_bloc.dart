import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:rosseti_second/second_try/repo/sing_in_repo.dart';

part 'sing_in_event.dart';
part 'sing_in_state.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  final SingInRepo _singInRepo;
  SingInBloc({required SingInRepo singInRepo})
      : _singInRepo = singInRepo,
        super(SingInInitial()) {
    on<FetchCodeEvent>(
      (event, emit) async {
        emit(SingInLoading());
        try {
          final code = await _singInRepo.getCode(event.phone);
          emit(SingInCodeTaked(phone: event.phone, code: code));
        } catch (e) {
          emit(const SingInError("Failed to fetch token"));
        }
      },
    );
    on<OpenSecondEvent>(
      (event, emit) => emit(SinInSecondPage()),
    );

    on<FetchTokenEvent>(
      (event, emit) async {
        emit(SingInLoading());
        try {
          final token = await _singInRepo.getToken(event.phone, event.code);
          _singInRepo.saveTokenLocaly(token);
          emit(SingInDone(token: token));
        } catch (e) {
          emit(const SingInError("Failed to fetch token"));
        }
      },
    );
  }
}
