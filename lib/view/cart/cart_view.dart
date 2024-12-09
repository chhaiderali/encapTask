import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../configs/components/network_image_widget.dart';
import '../../view_model/cart/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isEmpty) {
            return const Center(child: Text('No items in the cart.'));
          }

          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartProvider.cartItems[index];
              return Card(
                child: ListTile(
                  leading: NetworkImageWidget(
                    borderRadius: 5,
                    imageUrl: product.imageUrl.toString(),
                  ),
                  title: Text(product.name.toString()),
                  subtitle: Text('\$${product.price.toString()}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      cartProvider.removeFromCart(product);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
