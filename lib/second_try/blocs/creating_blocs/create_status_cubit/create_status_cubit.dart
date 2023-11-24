import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum CreatingPageStatus { first, second, third, fourh }

class CreateStatusCubit extends Cubit<CreatingPageStatus> {
  CreateStatusCubit() : super(CreatingPageStatus.first);

  updateCreatingPageStatus({required CreatingPageStatus status}) =>
      emit(status);
}
