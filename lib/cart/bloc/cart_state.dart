import '../model/product_data.dart';

abstract class CartState {
  final List<ProductData> cartItems;
  CartState({required this.cartItems});
}

class InitCartState extends CartState {
  final List<ProductData> cartItems;
  InitCartState({required this.cartItems}) : super(cartItems: cartItems);
}

class AddCartState extends CartState {
  final List<ProductData> cartItems;
  AddCartState({required this.cartItems}) : super(cartItems: cartItems);
}

class RemoveCartState extends CartState {
  final List<ProductData> cartItems;
  RemoveCartState({required this.cartItems}) : super(cartItems: cartItems);
}
