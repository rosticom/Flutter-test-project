
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ItemLayoutGrid extends StatelessWidget {
  ItemLayoutGrid({Key? key,
    required this.items,
  }) : super(key: key); 
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      columnSizes: [1.fr],
      rowSizes: const [auto, auto, auto, auto, auto, auto],
      rowGap: 0, 
      children: [
        for (var i = 0; i < items.length-1; i++)
          items[i],
      ],
    );
  }
}