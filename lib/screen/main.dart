import 'package:negocio_jordy/screen/screen.dart';
import 'package:negocio_jordy/services/proveedor_service.dart';
import 'package:negocio_jordy/screen/listar_categoria.dart';
import 'package:negocio_jordy/screen/listar_proveedor.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProveedorService>(
          create: (context) => ProveedorService(),
        ),
        // Agrega otros providers aquí si es necesario.
      ],
      child: MaterialApp(
        home: Main(),
      ),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}); // Cambiado 'super' a 'Key?'
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _pageIndex = 0;
  List<Widget> _pages = [
    ListarProveedor(),
    ListarCategoria(),
    ListProductScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online'),
        elevation: 1,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _pageIndex = int.parse(value) - 1; //
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: '1',
                child: Text('PROVEEDORES'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('CATEGORIAS'),
              ),
              PopupMenuItem(
                value: '3',
                child: Text('PRODUCTOS'),
              ),
            ],
          )
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
