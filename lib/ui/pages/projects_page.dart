import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestion_ckeck_bloc/suggestion_check_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestions_bloc/suggestion_bloc.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final blocOfSuggestions = context.watch<SuggestionBloc>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("projects_string"),
        actions: getActions(context: context),
      ),
      body: BlocBuilder<SuggestionBloc, SuggestionState>(
        builder: (context, state) {
          switch (state.status) {
            case SuggestionsStatus.initial:
              blocOfSuggestions.add(LoadSuggestions());
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SuggestionsStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SuggestionsStatus.done:
              return ListView.builder(
                itemCount: state.suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = state.suggestions.elementAt(index);
                  return projectCard(
                      author: suggestion.author!.fullName!,
                      projectName: suggestion.title!,
                      projectTopic: suggestion.topicId.toString(),
                      projectImageUrl: suggestion.existingSolutionImage!,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProjectDescriptionPage(
                                  suggestion: suggestion,
                                )));
                      });
                },
              );
            case SuggestionsStatus.error:
              return Center(
                child: Text(state.error!),
              );
          }
        },
      ),
    ));
  }
}
