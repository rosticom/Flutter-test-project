
import 'package:flutter/material.dart';
import 'package:test_prj/screens/widgets/line_painter.dart';

class CloseButtonWidget extends StatelessWidget {
  CloseButtonWidget(this._contextParent, {Key? key}) : super(key: key);
  final BuildContext _contextParent;

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.center,
    width: 48,
    height: 48,
    child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Container(
          width: 15.51,
          height: 15.51,
          child: CustomPaint(
           foregroundPainter: LinePainter(),
  )),
    onPressed: () => _closeButton(),
  ));

  _closeButton() {
    Navigator.of(_contextParent).pop();
  }
}
