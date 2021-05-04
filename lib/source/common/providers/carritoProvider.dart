import 'package:flutter/foundation.dart';
import 'package:state_management/source/domain/item.dart';

class CarritoProvider extends ChangeNotifier {
  bool loading = false;
  final List<Item> cartItems;
  double get cartTotal =>
      cartItems.isNotEmpty ? cartItems.map((val) => val.price).reduce((val1, val2) => val1 + val2) : 0.0;

  CarritoProvider(this.cartItems);

  Future<void> checkout() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    notifyListeners();
  }
}
