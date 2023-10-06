import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rosseti_second/models/models.dart';
import 'package:rosseti_second/ui/pages/video_player_page.dart';
import 'constants/constants.dart';
import 'package:video_player/video_player.dart';
import 'ui/pages/pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Globals.takeSize(MediaQuery.of(context).size);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(),
          actionIconTheme: ActionIconThemeData(
            backButtonIconBuilder: (context) =>
                const Icon(Icons.arrow_back_ios),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: mainColor,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          fontFamily: 'ABeeZee',
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(),
            titleTextStyle: appbarTextStyle,
            centerTitle: true,
            foregroundColor: mainColor,
            backgroundColor: Colors.transparent,
            toolbarHeight: 100,
          ),
        ),
        home: const StartPage());
  }
}

class ProjectsForCheckPage extends StatefulWidget {
  const ProjectsForCheckPage({
    super.key,
  });

  @override
  State<ProjectsForCheckPage> createState() => _ProjectsForCheckPageState();
}

class _ProjectsForCheckPageState extends State<ProjectsForCheckPage> {
  List<Suggestion> suggestions = Globals().suggesitons;

  @override
  Widget build(BuildContext context) {
    if (Globals().suggesitons.isEmpty) {
      Future.delayed(const Duration(seconds: 2), () => setState(() {}));
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const Text("Проекты"),
                actions: getActions(context: context),
              ),
              body: Center(child: const CircularProgressIndicator())));
    } else {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Проекты"),
          actions: getActions(context: context),
        ),
        body: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => DoExpertDissizionPage(
                        suggestion: suggestions[index]))));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 123,
                  width: double.infinity,
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                            spreadRadius: -6,
                            blurRadius: 10,
                            color: Colors.grey)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  suggestions[index].existingSolutionImage ??
                                      "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
                                ))),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(suggestions[index].title ?? "title",
                                style: standart,
                                overflow: TextOverflow.ellipsis),
                            const Spacer(),
                            Text(
                              suggestions[index].author!.fullName ?? "author",
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xffA1A1A1)),
                            ),
                            Text(suggestions[index].topicId.toString(),
                                style: const TextStyle(
                                    fontSize: 14, color: mainColor))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ));
    }
  }
}

class DoExpertDissizionPage extends StatefulWidget {
  final Suggestion suggestion;
  const DoExpertDissizionPage({
    super.key,
    required this.suggestion,
  });

  @override
  State<DoExpertDissizionPage> createState() => _DoExpertDissizionPageState();
}

class _DoExpertDissizionPageState extends State<DoExpertDissizionPage> {
  VideoPlayerController? _proposedVideoController;
  VideoPlayerController? _existingVideoController;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.suggestion.existingSolutionVideo != null) {
      _existingVideoController = VideoPlayerController.networkUrl(
          Uri.parse(widget.suggestion.existingSolutionVideo!))
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      haveVideo = false;
      setState(() {});
    }
    if (widget.suggestion.proposedSolutionVideo != null) {
      _proposedVideoController = VideoPlayerController.networkUrl(
          Uri.parse(widget.suggestion.proposedSolutionVideo!))
        ..initialize().then((_) {
          _existingVideoController!.seekTo(Duration.zero);

          setState(() {});
        });
    } else {
      haveVideo = false;
      setState(() {});
    }
    super.initState();
  }

  bool haveVideo = true;

  @override
  void dispose() {
    // TODO: implement dispose
    if (_existingVideoController != null && _proposedVideoController != null) {
      _existingVideoController!.dispose();
      _proposedVideoController!.dispose();
    }
    super.dispose();
  }

  double dub = 0;
  @override
  Widget build(BuildContext context) {
    Size size = Globals().size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Создать"),
        actions: getActions(context: context),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: ListView(
            shrinkWrap: true,
            children: [
              CheckProjectCard(
                  size: size,
                  title: 'Сейчас так:',
                  description: widget.suggestion.existingSolutionText ?? "",
                  networkImagePath: widget.suggestion.existingSolutionImage,
                  networkVideoPath:
                      widget.suggestion.existingSolutionVideo ?? "",
                  videoPlayerController: _existingVideoController),
              const SizedBox(
                height: 25,
              ),
              CheckProjectCard(
                size: size,
                title: 'Будет так:',
                description: widget.suggestion.proposedSolutionText ?? "",
                networkImagePath: widget.suggestion.proposedSolutionImage,
                networkVideoPath: widget.suggestion.proposedSolutionVideo ?? "",
                videoPlayerController: _proposedVideoController,
              ),
              const SizedBox(
                height: 25,
              ),
              ProjectsOutputs(
                  title: "И тогда будет так :",
                  size: size,
                  description: widget.suggestion.positiveEffect ?? ""),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Text(
                    "Оцените проект:",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              builderRaiting((double asdf) {
                dub = asdf;
                setState(() {});
              }),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ContinueButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Conversation(),
                      ));
                    },
                    text: "Обсудить"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                      child: SizedBox(
                    height: 58,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: const Icon(Icons.add)),
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 58,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: mainColor),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const RotationTransition(
                              turns: AlwaysStoppedAnimation(45 / 360),
                              child: Icon(
                                Icons.add,
                              ))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    ));
  }

  RatingBar builderRaiting(void getRaiting(double value)) {
    return RatingBar.builder(
        initialRating: 4,
        glowColor: Colors.amber,
        unratedColor: Colors.grey.withOpacity(0.3),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemPadding: const EdgeInsets.all(8),
        itemSize: 40,
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (ratingValue) {
          getRaiting(ratingValue);
        });
  }
}

class CheckProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? networkImagePath;
  final String networkVideoPath;
  final VideoPlayerController? videoPlayerController;
  const CheckProjectCard({
    super.key,
    required this.size,
    required this.title,
    required this.description,
    required this.networkImagePath,
    required this.networkVideoPath,
    required this.videoPlayerController,
  });

  final Size size;

  @override
  State<CheckProjectCard> createState() => _CheckProjectCardState();
}

class _CheckProjectCardState extends State<CheckProjectCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProjectsOutputs(
        title: widget.title,
        description: widget.description,
        size: widget.size,
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 68,
              width: 121,
              child: widget.networkImagePath == null
                  ? null
                  : GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Hero(
                              tag: widget.networkImagePath!,
                              child: Image.network(widget.networkImagePath!)),
                        ));
                      },
                      child: Hero(
                          tag: widget.networkImagePath!,
                          child: Image.network(widget.networkImagePath!))),
            ),
            SizedBox(
                height: 68,
                width: 121,
                child: widget.networkVideoPath == ""
                    ? null
                    : GestureDetector(
                        onTap: () {
                          if (widget.videoPlayerController != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VideoPage(
                                videoPath: widget.networkVideoPath,
                              ),
                            ));
                          }
                        },
                        child: widget.videoPlayerController != null
                            ? VideoPlayer(widget.videoPlayerController!)
                            : Center(child: CircularProgressIndicator()),
                      )),
          ],
        ),
      )
    ]);
  }
}

class ProjectsOutputs extends StatelessWidget {
  final String title;
  final Size size;
  final String description;

  const ProjectsOutputs({
    super.key,
    required this.title,
    required this.size,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: standart,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: size.width,
            height: size.width - 29 * 2,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.4),
                      blurStyle: BlurStyle.solid)
                ]),
            child: Text(
              description,
              style: standart,
            )),
      ],
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSendByMe;

  Message({required this.text, required this.date, required this.isSendByMe});
}
