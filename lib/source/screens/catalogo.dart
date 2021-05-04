import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/source/domain/item.dart' show Item;
import 'package:state_management/source/common/providers/catalogoProvider.dart';
import 'catalogo_action_buttons.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen._();

  static ChangeNotifierProvider init() =>
      ChangeNotifierProvider<CatalogoProvider>(
        create: (_) => CatalogoProvider()..loadData(),
        builder: (_, __) => CatalogScreen._(),
      );

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<CatalogoProvider>(context);
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
                color: Theme.of(context).accentColor,
              ),
        ),
      ),
      body: provider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: provider.allMyItems.length,
              itemBuilder: (_, index) => CatalogItem(
                item: provider.allMyItems[index],
                wasAdded: provider.cartItems.contains(
                  provider.allMyItems[index],
                ),
                onTap: () {
                  provider.addItem(provider.allMyItems[index]);
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
      title: Text(item.name),
      subtitle: Text("\$${item.price}"),
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
