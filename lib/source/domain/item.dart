import 'package:flutter/material.dart';

const nombresItems = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

List<Item> _items = List.generate(
  nombresItems.length,
  (index) => Item(
    id: index,
    nombre: nombresItems[index],
  ),
);

List<Item> get allItems => List.unmodifiable(_items);

@immutable
class Item {
  final int id;
  final String nombre;
  final Color color;
  final double precio;

  Item({
    this.id,
    this.nombre,
  })  : this.color = Colors.primaries[id % Colors.primaries.length],
        this.precio = (id + 1) * 10.0;
}
