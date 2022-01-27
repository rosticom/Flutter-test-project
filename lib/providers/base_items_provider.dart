
import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';

abstract class BaseItemsProvider extends ChangeNotifier {
  BaseItemsProvider() {
    _runAutoUpdates();
  }

  Timer? _timer;
  List<String> _items = const [];

  int get itemsCount => _items.length;

  String? itemAt(int index) {
    if (index >= 0 && index < itemsCount) return _items[index];

    return null;
  }

  String generateItemAt(int index);

  Duration get delayBeforeStartUpdate => Duration.zero;

  @override
  void dispose() {
    super.dispose();
  
    _timer?.cancel();
  }

  Future<void> _runAutoUpdates() async {
    _reloadItems();

    await Future.delayed(delayBeforeStartUpdate);

    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        _reloadItems();
      },
    );
  }

  void _reloadItems() {
    final random = Random.secure();

    final startIndex = random.nextInt(100);

    _items = List.generate(
      random.nextInt(100),
      (index) => generateItemAt(startIndex + index),
    );

    notifyListeners();
  }
}
