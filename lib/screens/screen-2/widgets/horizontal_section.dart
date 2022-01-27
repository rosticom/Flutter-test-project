
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/providers/horizontal_items.dart';
import 'package:test_prj/screens/screen-2/widgets/section_item.dart';

class HorizontalSection extends StatefulWidget {
  HorizontalSection(
    this.itemsList, 
    {Key? key}) : super(key: key);
  final List<String> itemsList;

  @override
  State<HorizontalSection> createState() => _HorizontalSectionState();
}

class _HorizontalSectionState extends State<HorizontalSection> {
  final CarouselController _controller = CarouselController();
  
  final List<String> _horisontalItems = ['1', '2'];
  final _horisontalProviderController = HorizontalItemsProvider();
  final int _pageId = 0;

  @override
  void initState() {
    _horisontalItemsNumberUpdate(_pageId);
    _horisontalProviderController.addListener(() {
        if (mounted) {
          setState(() { 
            _horisontalItemsNumberUpdate(_pageId);
          });
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetsSliders = widget.itemsList.map((item) 
      => Stack(
            children: <Widget>[
              item=='1' ? SectionItem(true, _horisontalItems[0]) : const SizedBox(),
              item=='2' ? SectionItem(true, _horisontalItems[1]) : const SizedBox(),
            ],
      )
    ).toList(); 
    
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: 168,
        enableInfiniteScroll: false,
        viewportFraction: 0.85,
        aspectRatio: 1,
        autoPlay: false,
        enlargeCenterPage: false,
        onPageChanged: (_index, caruseler) => _carouselPageChanged(_index),
        scrollDirection: Axis.horizontal,
      ),
      items: _widgetsSliders,
    );
  }

  void _carouselPageChanged(int _pageId) {
    _pageId = _pageId;
    Provider.of<HorizontalItemsProvider>(context, listen: false).generateItemAt(_pageId);
    _horisontalItemsNumberUpdate(_pageId);
    if (mounted) {
      setState(() {});
    }
  }

  void _horisontalItemsNumberUpdate(int _pageId) {
    Provider.of<HorizontalItemsProvider>(context, listen: false).generateItemAt(_pageId); 
    String horisontalItem = '0';
    horisontalItem = Provider.of<HorizontalItemsProvider>(context, listen: false).itemAt(_pageId)!;
    _horisontalItems[_pageId] = horisontalItem.replaceAll(RegExp(r'[^0-9]'),'');
  }
}