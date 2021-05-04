import 'package:flutter/material.dart';
import 'package:state_management/source/common/providers/catalogoProvider.dart';
import 'carrito.dart';
import 'package:provider/provider.dart';

class CatalogoActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CatalogoProvider>(context, listen: false);
    return Row(
      children: [
        provider.elementosCarrito.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  provider.eliminarTodos();
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                final page = PantallaCarrito.init(provider.elementosCarrito);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            ),
            Positioned(
              right: 5.0,
              top: 0.0,
              child: provider.elementosCarrito.isNotEmpty
                  ? CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        provider.elementosCarrito.length.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }
}
