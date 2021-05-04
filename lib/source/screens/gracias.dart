import 'package:flutter/material.dart';
import 'catalogo.dart';

class PantallaGracias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Gracias por comprar',
              style: Theme.of(context).textTheme.headline5,
            ),
            FlutterLogo(
              size: 100,
            ),
            ElevatedButton(
              child: Text("Volver"),
              onPressed: () {
                final page = CatalogScreen.init();
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => page),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
