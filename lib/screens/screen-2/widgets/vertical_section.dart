
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/providers/vertical_items.dart';
import 'package:test_prj/screens/screen-2/widgets/horizontal_section.dart';
import 'package:test_prj/screens/screen-2/widgets/item_layout_grid.dart';
import 'package:test_prj/screens/screen-2/widgets/section_item.dart';
import 'package:test_prj/screens/screen-2/widgets/section_text.dart';
import 'package:test_prj/screens/widgets/close_button.dart';

class VerticalSection extends StatefulWidget {
  VerticalSection(
    this.horisontalItemList, 
    {Key? key}) : super(key: key);
  final List<String> horisontalItemList;
  

  @override
  State<VerticalSection> createState() => _VerticalSectionState();
}

class _VerticalSectionState extends State<VerticalSection> {
  final List<String> _itemsList = ['0', '1', '2', '3', '4', '5', '6'];
  int _lengthHorisontalItems = 0;
  int _lengthVerticalItems = 0;
  final _verticalProviderController = VerticalItemsProvider();
  int _verticalItem = 1;

  @override
  void initState() {
    _lengthHorisontalItems = widget.horisontalItemList.length;
    _lengthVerticalItems = _itemsList.length - 3;
    _verticalItemsNumberUpdate();
    _verticalProviderController.addListener(() {
        if (mounted) {
          setState(() { 
            _verticalItemsNumberUpdate();
          });
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetsSliders = _itemsList.map((item) 
        => Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: item=='0'
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CloseButtonWidget(context))
                : item=='1' 
                ? Column(
                    children: [
                      sectionText("Section 1 ($_lengthHorisontalItems)", false),
                      const SizedBox(height: 8),
                      HorizontalSection(widget.horisontalItemList) 
                ])
                : item=='2' 
                ? Column(
                  children: [
                    sectionText("Section 2 ($_lengthVerticalItems)", false),
                    const SizedBox(height: 8),
                    SectionItem(false, (_verticalItem).toString())
                ])
                : item=='3' 
                ? SectionItem(false, (_verticalItem+1).toString())
                : item=='4' 
                ? SectionItem(false, (_verticalItem+2).toString())
                : item=='5' 
                ? SectionItem(false, (_verticalItem+3).toString())
                : item=='6' 
                ? SectionItem(false, (_verticalItem+4).toString()) 
                : const SizedBox(),
        )).toList(); 
    
    return Container(
        child: SingleChildScrollView(
          child: ItemLayoutGrid(items: _widgetsSliders)
        )
    );
  }

  void _verticalItemsNumberUpdate() {
    Provider.of<VerticalItemsProvider>(context, listen: false).generateItemAt(0);
    String _verticalItemString = Provider.of<VerticalItemsProvider>(context, listen: false)
      .itemAt(0)!
      .replaceAll(RegExp(r'[^0-9]'),'');
    _verticalItem = int.parse(_verticalItemString);
  }
}

