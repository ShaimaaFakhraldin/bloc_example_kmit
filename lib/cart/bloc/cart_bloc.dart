import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/create_list.dart';
import '../model/product_data.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  List<ProductData> products = [];
  CartBloc() : super(InitCartState(cartItems: [])) {
    products = getProduct();
    on<AddCartEvents>((event, emit) {
      state.cartItems.add(event.productData);
      emit(AddCartState(cartItems: state.cartItems));
    });
    on<RemoveCartEvents>((event, emit) {
      state.cartItems.remove(event.productData);
      emit(RemoveCartState(cartItems: state.cartItems));
    });
  }
}
