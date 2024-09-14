import 'package:flutter/material.dart';
import 'package:weathery/screens/home_screen.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color.fromARGB(255, 153, 152, 243), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/start_image.png",
                height: 250,
                width: 230,
              ),
            ),
            const Text(
              "Weather",
              style: TextStyle(
                  fontFamily: "Kadwa",
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) =>const HomeScreen()));
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 200),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        const Color(0xff0482CA),
                        const Color(0xff0482CA).withOpacity(.2)
                      ])),
                  child: const Center(
                      child: Text(
                    "let's start ",
                    style: TextStyle(
                        fontFamily: "Kadwa",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
