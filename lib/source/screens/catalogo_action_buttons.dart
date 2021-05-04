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
        provider.cartItems.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.deleteAll();
                },
              )
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final page = PantallaCarrito.init(provider.cartItems);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            ),
            Positioned(
              right: 5.0,
              top: 0.0,
              child: provider.cartItems.isNotEmpty
                  ? CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        provider.cartItems.length.toString(),
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
