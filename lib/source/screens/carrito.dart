import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/source/common/providers/carritoProvider.dart';
import 'package:state_management/source/domain/item.dart';
import 'gracias.dart';

class PantallaCarrito extends StatelessWidget {
  PantallaCarrito._();

  static ChangeNotifierProvider init(List<Item> cartItems) =>
      ChangeNotifierProvider<CarritoProvider>(
        create: (_) => CarritoProvider(cartItems),
        builder: (_, __) => PantallaCarrito._(),
      );

  void comprarCarrito(BuildContext context) async {
    final provider = context.read<CarritoProvider>();
    await provider.comprar();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => PantallaGracias(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CarritoProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Carrito de Compras",
          style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                for (var item in provider.elementosCarrito)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '* ${item.nombre}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${item.precio}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "Total : ${provider.totalCarrito}",
                  style: Theme.of(context).textTheme.headline2,
                ),
                if (provider.loading)
                  Center(
                    child: CircularProgressIndicator(),
                  )
                else if (provider.elementosCarrito.isNotEmpty)
                  ElevatedButton(
                    child: Text("Comprar Carrito"),
                    onPressed: () {
                      comprarCarrito(context);
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
