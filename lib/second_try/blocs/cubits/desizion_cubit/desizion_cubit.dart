import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rosseti_second/second_try/providers/expert_disizion.dart';

part 'desizion_state.dart';

class DesizionCubit extends Cubit<DesizionState> {
  late final ExpertDesizionProviders _desizionProviders;
  DesizionCubit({required ExpertDesizionProviders desizionProviders})
      : _desizionProviders = desizionProviders,
        super(DesizionInitial());

  postDesizion(
      {required BuildContext context,
      required int accepted,
      required int suggestionId,
      required int expertId}) async {
    final res = await _desizionProviders.addExpertEvaliation(
        suggestionId: suggestionId, accepted: accepted, expertId: expertId);

    res.fold(
        (l) => print(l.toString()),
        (r) => showDialog(
            context: context,
            builder: (context) => Center(
                  child: Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    clipBehavior: Clip.hardEdge,
                    child: Scaffold(
                      body: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text.rich(TextSpan(text: "DesizionSended")),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("ok")),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
