import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysecondapp/components/button.dart';
import 'package:mysecondapp/models/food.dart';
import 'package:mysecondapp/models/shop.dart';
import 'package:mysecondapp/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
//get access to the shop
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
            title: const Text('Cart Page'),
            elevation: 0,
            backgroundColor: primaryColor,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Column(
          children: [
            //customer
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  //get food from cart
                  final food = value.cart[index];

                  //get food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price;

                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                        title: Text(
                          foodName,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          foodPrice,
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            CupertinoIcons.delete,
                            color: Color.fromARGB(255, 218, 218, 218),
                          ),
                          onPressed: () => removeFromCart(food, context),
                        )),
                  );
                },
              ),
            ),
            //pay button
            Padding(
              padding: const EdgeInsets.all(25),
              child: MyButton(text: "Pay Now", onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
