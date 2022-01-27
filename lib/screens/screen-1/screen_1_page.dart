
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_prj/constant/colors.dart';
import 'package:test_prj/constant/text_asset.dart';
import 'package:test_prj/screens/widgets/close_button.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
        statusBarColor: ProjectColor.backgroundFirstScreen,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: ProjectColor.backgroundFirstScreen,
        systemNavigationBarIconBrightness: Brightness.dark
    ));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColor.backgroundFirstScreen,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 581), 
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight, 
                      child: CloseButtonWidget(context)
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          "Title",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                    )))
                  ],
                ),
                const Padding(
                 padding: EdgeInsets.all(16),
                 child: Text(
                  TextAsset.firstScreenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                ))),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxHeight: 400),
                        color: ProjectColor.scrollTextBackground,
                      ),  
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 8,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ProjectColor.scrollTextShadow,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)
                            ),
                          ),
                      )),
                      Container(
                        padding: const EdgeInsets.only(right: 2),
                        color: Colors.transparent,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Container(
                            constraints: const BoxConstraints(maxHeight: 400),
                            child: RawScrollbar(
                            mainAxisMargin: 4,
                            thumbColor: ProjectColor.scrollBarColor,
                            thickness: 4,
                            radius: const Radius.circular(32),
                            isAlwaysShown: true,
                            child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 1),
                                    child: Column(
                                      children: [
                                        textParagraph(TextAsset.scrollableFirstParagraph),
                                        const SizedBox(height: 16),
                                        textParagraph(TextAsset.scrollableSecondParagraph),
                                        const SizedBox(height: 16),
                                        textParagraph(TextAsset.scrollableThirdParagraph)
                                      ],
                                    )),
                      )))))
                    ],
                  )),
                Container(
                  height: 76,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                     color: ProjectColor.white,
                     borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)
                  )),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ProjectColor.buttonTestBackground,
                      ),
                      width: 140,
                      height: 44,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: TextButton(
                        onPressed: () => {}, 
                        child: Text(
                            "Test Button".toUpperCase(),
                            style: const TextStyle(
                              color: ProjectColor.white),
                        ))
                  )
                )
              ])
          )
        )
      ),
    );
  }

  Widget textParagraph(String paragraph) =>
    Text(
      paragraph,
      style: const TextStyle(
        fontSize: 14.0,
        height: 1.172,
        color: Colors.black
      ),
    );
}
