import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/source/domain/item.dart' show Item;
import 'package:state_management/source/common/providers/catalogoProvider.dart';
import 'catalogo_action_buttons.dart';

class PantallaCatalogo extends StatelessWidget {
  PantallaCatalogo._();

  static ChangeNotifierProvider init() =>
      ChangeNotifierProvider<CatalogoProvider>(
        create: (_) => CatalogoProvider()..cargarDatos(),
        builder: (_, __) => PantallaCatalogo._(),
      );

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<CatalogoProvider>(context, listen: true);
    final provider = context.watch<CatalogoProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          CatalogoActionButtons(),
        ],
        title: Text(
          "Catálogo",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      body: provider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: provider.todosMisElementos.length,
              itemBuilder: (_, index) => CatalogItem(
                item: provider.todosMisElementos[index],
                wasAdded: provider.elementosCarrito.contains(
                  provider.todosMisElementos[index],
                ),
                onTap: () {
                  provider.agregarItem(provider.todosMisElementos[index]);
                },
              ),
              separatorBuilder: (_, index) => Divider(),
            ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final bool wasAdded;
  const CatalogItem({
    Key key,
    this.item,
    this.onTap,
    this.wasAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Container(
        height: 50,
        width: 50,
        color: item.color,
      ),
      title: Text(item.nombre),
      subtitle: Text("\$${item.precio}"),
      trailing: !wasAdded
          ? OutlinedButton(
              child: Text("AGREGAR"),
              onPressed: onTap,
            )
          : Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.check),
            ),
    );
  }
}
