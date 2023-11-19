import 'package:bloc_example/cart/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../model/product_data.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductData> myList = context.read<CartBloc>().products;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              BlocConsumer<CartBloc, CartState>(
                builder: (BuildContext context, CartState state) {
                  return Positioned(
                    left: 5,
                    child: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      // padding: EdgeInsets.all(5),
                      child: Text(
                        "${state.cartItems.length}",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                    ),
                  );
                },
                listener: (BuildContext context, CartState state) {},
              ),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: Icon(Icons.mail_outline_outlined,
                    color: myList[index].color),
                title: Text("${myList[index].name}"),
                trailing: BlocConsumer<CartBloc, CartState>(
                  builder: (BuildContext context, CartState state) {
                    return IconButton(
                        onPressed: () {
                          if (state.cartItems.contains(myList[index])) {
                            context.read<CartBloc>().add(
                                RemoveCartEvents(productData: myList[index]));
                          } else {
                            context
                                .read<CartBloc>()
                                .add(AddCartEvents(productData: myList[index]));
                          }
                        },
                        icon: state.cartItems.contains(myList[index])
                            ? Icon(
                                Icons.shopping_cart,
                                color: Colors.red,
                              )
                            : Icon(Icons.shopping_cart_outlined));
                  },
                  listener: (BuildContext context, CartState state) {
                    if (state is AddCartState) {
                      Fluttertoast.showToast(
                          msg: "item added successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                ));
          }),
    );
  }
}
