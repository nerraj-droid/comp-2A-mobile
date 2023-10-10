import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_creator/loginpage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(250)),
                  child: Image.asset(
                    "assets/qr.jpg",
                  ),
                ),
                Text(
                  "QR Generator",
                  style: GoogleFonts.aboreto(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Any type of description",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 150),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: const Size(double.maxFinite, 50)),
                  icon: const Icon(
                    Icons.arrow_right_rounded,
                    size: 40,
                  ),
                  label: const Text(
                    "Begin Application",
                    style: TextStyle(color: Color.fromARGB(255, 90, 17, 17)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
