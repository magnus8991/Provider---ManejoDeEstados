import 'package:flutter/material.dart';
import 'catalogo.dart';

class PantallaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Bienvenido",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Nombre de Usuario",
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Contraseña",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Entrar"),
              onPressed: () {
                final page = CatalogScreen.init();
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
