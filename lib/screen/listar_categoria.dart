import 'package:flutter/material.dart';
import 'package:negocio_jordy/models/category.dart';
import 'package:negocio_jordy/services/category_service.dart';
import 'package:negocio_jordy/widgets/tarjetas_categoria.dart';
import 'package:provider/provider.dart';
import 'package:negocio_jordy/screen/screen.dart';

class ListarCategoria extends StatelessWidget {
  const ListarCategoria({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return LoadingScreen();
    return Scaffold(
      body: ListView.builder(
        itemCount: categoryService.categorys.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.SelectCategory =
                categoryService.categorys[index].copy();
            Navigator.pushNamed(context, 'edit_categoria');
          },
          child: CategoryCard(category: categoryService.categorys[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.SelectCategory =
              Listado(categoryId: 0, categoryName: '', categoryState: '');
          Navigator.pushNamed(context, 'edit_categoria');
        },
      ),
    );
  }
}
