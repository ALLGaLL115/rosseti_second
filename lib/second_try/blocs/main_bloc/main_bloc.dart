import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/boxes/user_box.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/second_try/repo/main_repo.dart';
import 'package:rosseti_second/second_try/repo/topics_repo.dart';
import 'package:rosseti_second/second_try/repo/user_repo.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  late UserRepository _userRepository;
  late TopicsRepository _topicsRepository;
  late final MainRepository _mainRepository;
  late StreamSubscription<MainStatus> _mainRepositorySubscription;

  MainBloc(
      {required UserRepository userRepository,
      required TopicsRepository topicsRepository,
      required MainRepository mainRepository})
      : _topicsRepository = topicsRepository,
        _userRepository = userRepository,
        _mainRepository = mainRepository,
        super(const MainState(status: MainStatus.initialPage)) {
    on<MainStatusChanged>(
        (event, emit) => emit(MainState(status: event.status)));
    _mainRepositorySubscription = _mainRepository.status.listen((status) {
      add(MainStatusChanged(status: status));
    });

    // on<CheckUserEvent>((event, emit) async {
    //   final userBox = Boxes.getUserBox();
    //   if (userBox.isEmpty) {
    //     emit(MainLoading());
    //     final user = await _userRepository.getUser();
    //     _userRepository.saveUser(user);
    //     emit(UserStatus(user: user));
    //   } else {
    //     final user = userBox.values.single;
    //     emit(UserStatus(user: user));
    //   }

    //     // TODO: implement event handler
    //   });

    //   on<StartCreating>(
    //     (event, emit) async {
    //       final topicsBox = Boxes.getTopicsBox();
    //       if (topicsBox.isEmpty) {
    //         emit(MainLoading());
    //         final topics = await _topicsRepository.getTopics();
    //         _topicsRepository.saveTopics(topics);
    //         emit(CreateProjectState(topics: topics));
    //       } else {
    //         final topics = topicsBox.values.single;
    //         emit(CreateProjectState(topics: topics));
    //       }
    //     },
    //   );
    //   on<GoToInitial>((event, emit) => emit(MainInitial()));
    // }
  }
}
