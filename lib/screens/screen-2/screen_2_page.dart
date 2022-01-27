
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_prj/constant/colors.dart';
import 'package:test_prj/screens/screen-2/widgets/vertical_section.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final List<String> _itemsHorisontalList = ['1', '2'];
  @override
  void initState() {
     SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
        statusBarColor: ProjectColor.backgroundSecondScreen,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ProjectColor.backgroundSecondScreen,
        systemNavigationBarIconBrightness: Brightness.dark
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
      color: ProjectColor.backgroundSecondScreen,
      child: Stack(
        children: [
          VerticalScrolling(_itemsHorisontalList),
        ],
    ))));
}

