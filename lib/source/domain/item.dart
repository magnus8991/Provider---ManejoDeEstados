import 'package:flutter/material.dart';

const _itemNames = [
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
  _itemNames.length,
  (index) => Item(
    id: index,
    name: _itemNames[index],
  ),
);

List<Item> get allItems => List.unmodifiable(_items);

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final double price;

  Item({
    this.id,
    this.name,
  })  : this.color = Colors.primaries[id % Colors.primaries.length],
        this.price = (id + 1) * 10.0;
}
