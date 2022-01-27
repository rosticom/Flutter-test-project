
import 'base_items_provider.dart';

class HorizontalItemsProvider extends BaseItemsProvider {
  @override
  String generateItemAt(int index) => 'Horizontal item $index';

  @override
  Duration get delayBeforeStartUpdate => const Duration(seconds: 5);
}
