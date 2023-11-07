import 'dart:async';

enum MainStatus {
  initialPage,
  creatingPage,
  userPage,
  projectsPage,
  suggestionPage
}

class MainRepository {
  final _controller = StreamController<MainStatus>();

  Stream<MainStatus> get status async* {
    yield MainStatus.initialPage;
    yield* _controller.stream;
  }

  openInitialPage() => _controller.add(MainStatus.initialPage);
  openCreatingPage() => _controller.add(MainStatus.creatingPage);
  openUserPage() => _controller.add(MainStatus.userPage);
  openProjectsPage() => _controller.add(MainStatus.projectsPage);
  openSuggestionPage() => _controller.add(MainStatus.suggestionPage);
}
