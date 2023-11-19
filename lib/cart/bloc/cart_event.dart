import '../model/product_data.dart';

abstract class CartEvents {}

class AddCartEvents extends CartEvents {
  ProductData productData;
  AddCartEvents({required this.productData});
}

class RemoveCartEvents extends CartEvents {
  ProductData productData;
  RemoveCartEvents({required this.productData});
}
