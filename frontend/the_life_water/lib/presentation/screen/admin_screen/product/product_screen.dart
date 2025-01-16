import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_life_water/domain/entities/product.dart';
import 'package:the_life_water/presentation/Provider/cliente_provider.dart';
import 'package:the_life_water/presentation/screen/admin_screen/product/create_new_product/product_client_detail.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WatchProductScreenState();
}

class WatchProductScreenState extends ConsumerState<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productList = ref.watch(productRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.refresh,
                size: 30,
              )),
          IconButton(
              onPressed: () {
                context.go('/product/create_new_product');
              },
              icon: const Icon(
                Icons.add_circle_outline,
                size: 30,
              )),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: productList.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No hay producto disponibles');
            } else {
              final products = snapshot.data!;
              return Center(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        leading: const Icon(Icons.water_drop_outlined),
                        title: Text(product.nombre),
                        trailing: Text(
                          '${product.precio.truncate()} CLP',
                          style: const TextStyle(fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductClientDetail(product: product),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
