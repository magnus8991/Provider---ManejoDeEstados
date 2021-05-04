import 'package:flutter/foundation.dart';
import 'package:state_management/source/domain/item.dart';

class CarritoProvider extends ChangeNotifier {
  bool loading = false;
  final List<Item> elementosCarrito;
  double get totalCarrito => elementosCarrito.isNotEmpty
      ? elementosCarrito
          .map((item) => item.precio)
          .reduce((valor1, valor2) => valor1 + valor2)
      : 0.0;

  CarritoProvider(this.elementosCarrito);

  Future<void> comprar() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    notifyListeners();
  }
}
