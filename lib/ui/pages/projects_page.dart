import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rosseti_second/second_try/blocs/load_suggestions_bloc/load_suggestions_bloc.dart';
import 'package:rosseti_second/second_try/providers/projects_provider.dart';
import 'package:rosseti_second/strings.dart';
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
    return BlocProvider(
      create: (context) => LoadSuggestionsBloc(
          projectsProvider: RepositoryProvider.of<ProjectsProvider>(context)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(stringsUi['projects']!),
          actions: getActions(context: context),
        ),
        body: BlocBuilder<LoadSuggestionsBloc, LoadSuggestionsState>(
          builder: (context, state) {
            switch (state.status) {
              case LoadSuggstionsStatus.loading:
                BlocProvider.of<LoadSuggestionsBloc>(context)
                    .add(const LoadSuggestionsEvent());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case LoadSuggstionsStatus.loaded:
                return ListView.builder(
                  itemCount: state.suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = state.suggestions[index];
                    if (suggestion.topicId! < 17) {
                      return projectCard(
                          suggestion: suggestion,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProjectDescriptionPage(
                                suggestion: suggestion,
                              ),
                            ));
                          });
                    }
                    return SizedBox();
                  },
                );
              case LoadSuggstionsStatus.error:
                return Text(state.error!);
            }
          },
        ),
      ),
    );
  }
}
