part of 'expertise_cubit.dart';

class ExpertiseState extends Equatable {
  final bool isExpertize;
  const ExpertiseState({required this.isExpertize});

  @override
  List<Object> get props => [isExpertize];
}

// final class ExpertiseInitial extends ExpertiseState {}
