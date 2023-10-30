import 'package:flutter/material.dart';
import 'package:negocio_jordy/models/proveedores.dart';
import 'package:negocio_jordy/services/proveedor_service.dart';
import 'package:provider/provider.dart';
import 'package:negocio_jordy/screen/screen.dart';

class ListarProveedor extends StatelessWidget {
  const ListarProveedor({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);
    if (proveedorService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Proveedores'),
      ),
      body: ListView.builder(
        itemCount: proveedorService.proveedors.length,
        itemBuilder: (BuildContext context, index) {
          final proveedor = proveedorService.proveedors[index];
          return ListTile(
            onTap: () {
              proveedorService.SelectProveedor = proveedor.copy();
              Navigator.pushNamed(context, 'edit_proveedor');
            },
            title: Text(proveedor.NombreProveedor),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(proveedor.ApellidoProveedor),
                Text(proveedor.MaildelProveedor),
              ],
            ),
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          proveedorService.SelectProveedor = Listado(
            CodigoProveedor: 0,
            NombreProveedor: '',
            ApellidoProveedor: '',
            MaildelProveedor: '',
            EstadodelProveedor: '',
          );
          Navigator.pushNamed(context, 'edit_proveedor');
        },
      ),
    );
  }
}
