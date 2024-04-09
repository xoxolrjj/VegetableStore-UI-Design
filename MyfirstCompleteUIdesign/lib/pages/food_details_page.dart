import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysecondapp/components/button.dart';
import 'package:mysecondapp/models/food.dart';
import 'package:mysecondapp/models/shop.dart';
import 'package:mysecondapp/theme/colors.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int productQuantity = 0;

  void decrementQuantity() {
    setState(() {
      if (productQuantity > 0) {
        productQuantity--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      setState(() {
        productQuantity++;
      });
    });
  }

  //add to cart
  void addToCart() {
    if (productQuantity > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, productQuantity);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully Added to cart!",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.checkmark,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Please select quantity!",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.checkmark,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          color: Colors.grey[900],
          tooltip: 'List',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //rating
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  //food name
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //price + quantity + add to cart
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  // price + quantity

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Text(
                        "\$${widget.food.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      //quantity
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),
                          //quantity count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                productQuantity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: incrementQuantity,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(text: "Add to Cart", onTap: addToCart),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
