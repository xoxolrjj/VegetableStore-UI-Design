import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysecondapp/components/button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 76, 43),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            //shopname
            Text(
              'BUKAY STORE',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/vegetable.png'),
            ),
            //title
            Text(
              'WELCOME TO OUR SHOP',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //subtitle
            Text(
              'feel the most popular culamboo cutter, it is the best cutter in the world!',
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //get started button
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
