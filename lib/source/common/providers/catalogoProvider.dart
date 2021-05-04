import 'package:flutter/material.dart';
import 'package:state_management/source/domain/item.dart';

class CatalogoProvider extends ChangeNotifier {
  final List<Item> elementosCarrito = [];
  List<Item> allMyItems = [];
  bool loading = false;

  void cargarDatos() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    allMyItems.clear();
    allMyItems.addAll(allItems);

    loading = false;
    notifyListeners();
  }

  void agregarItem(Item item) {
    elementosCarrito.add(item);
    notifyListeners();
  }

  void eliminarTodos() {
    elementosCarrito.clear();
    notifyListeners();
  }
}
