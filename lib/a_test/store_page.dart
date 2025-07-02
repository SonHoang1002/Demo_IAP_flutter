// store_page.dart
import 'package:demo_iap_flutter/providers/events/billing_event.dart';
import 'package:demo_iap_flutter/providers/states/billing_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../providers/blocs/billing_bloc.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  void initState() { 
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store')),
      body: BlocConsumer<BillingBloc, BillingState>(
        listener: (context, state) {
          if (state is BillingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return _buildProductList(state.products);
          } else if (state is BillingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('Load products to begin'));
        },
      ),
    );
  }

  Widget _buildProductList(List<ProductDetails> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(products[index].title),
        subtitle: Text(products[index].price),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context
              .read<BillingBloc>()
              .add(BillingPurchaseProductEvent(products[index])),
        ),
      ),
    );
  }
}
