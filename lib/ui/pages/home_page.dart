import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/cubits/expertize_cubit/expertise_cubit.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/text_styles.dart';
import 'package:rosseti_second/ui/pages/create_page1.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

// class MainPage extends StatefulWidget {
//   MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ExpertiseCubit(),
//       child: MainView(),
//     );
//   }
// }

class MainView extends StatelessWidget {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            stringsUi["appName"]!,
          ),
          actions: getActions(context: context),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            mainPageWidget(
                text: stringsUi["createAnOffer"]!,
                assetImagePath: "assets/images/create 1.png",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreatingView()));
                }),
            mainPageWidget(
                text: stringsUi["applications"]!,
                assetImagePath: "assets/images/idea 1.png",
                onPressed: () {
                  context.read<ExpertiseCubit>().changeExpertizeStatus(
                      isExpertize: false, context: context);
                }),
            mainPageWidget(
                text: stringsUi["expertise"]!,
                assetImagePath: "assets/images/skills 1.png",
                onPressed: () {
                  context.read<ExpertiseCubit>().changeExpertizeStatus(
                      isExpertize: true, context: context);
                }),
          ],
        ),
      ),
    );
  }
}
