import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final void Function()? onTap;

  const MyButton({super.key, required this.text, required this.onTap});
//Color.fromARGB(255, 138, 60, 55)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 11, 112, 67),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            // Icon(CupertinoIcons.arrow_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
