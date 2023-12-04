import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rosseti_second/ui/pages/projects_page.dart';

part 'expertise_state.dart';

class ExpertiseCubit extends Cubit<ExpertiseState> {
  ExpertiseCubit() : super(const ExpertiseState(isExpertize: false));

  changeExpertizeStatus(
      {required bool isExpertize, required BuildContext context}) {
    emit(ExpertiseState(isExpertize: isExpertize));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProjectsPage()));
  }
}
