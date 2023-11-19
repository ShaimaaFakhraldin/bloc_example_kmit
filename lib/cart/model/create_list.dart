import 'package:bloc_example/cart/model/product_data.dart';
import 'package:flutter/material.dart';

List<ProductData> getProduct() {
  List<ProductData> list = [];
  for (int i = 0; i <= 100; i++) {
    list.add(ProductData(
        id: i,
        name: "Product $i",
        color: Colors.primaries[i % Colors.primaries.length]));
  }
  return list;
}
