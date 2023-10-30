import 'package:flutter/material.dart';
import 'package:negocio_jordy/models/productos.dart';
import 'package:negocio_jordy/services/product_service.dart';
import 'package:negocio_jordy/widgets/tarjetas_poroductos.dart';
import 'package:provider/provider.dart';
import 'package:negocio_jordy/screen/screen.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingScreen();
    return Scaffold(
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            productService.SelectProduct =
                productService.products[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: ProductCard(product: productService.products[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
              CodigoProducto: 0,
              NombreProducto: '',
              PreciodelProducto: 0,
              Imagendelproducto:
                  'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
              EstadodelProducto: '');
          Navigator.pushNamed(context, 'edit');
        },
      ),
    );
  }
}
