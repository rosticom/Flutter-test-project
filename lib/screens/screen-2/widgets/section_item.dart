
import 'package:flutter/material.dart';
import 'package:test_prj/constant/colors.dart';
import 'package:test_prj/screens/screen-2/widgets/section_text.dart';

class SectionItem extends StatelessWidget {
  const SectionItem(
    this.horisontalItemBool, 
    this.itemNumber, 
    {Key? key}) : super(key: key);
  final bool horisontalItemBool;
  final String itemNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 
          horisontalItemBool==true 
          ? 8 
          : 16, 
        vertical: 8
      ),
      height: 150,
      decoration: BoxDecoration(
          color: ProjectColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: ProjectColor.sectionItemShadow,
              blurRadius: horisontalItemBool==true 
              ? 8 
              : 16,
            ),
          ],
      ),
      alignment: Alignment.center,
      child: sectionText(
        horisontalItemBool==true 
        ? "Horisontal item $itemNumber"
        : "Vertical item $itemNumber",
        true
      )
    );
  }
}