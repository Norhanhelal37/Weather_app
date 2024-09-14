import 'package:flutter/material.dart';
import 'package:weathery/widgets/exploar.dart';
import 'package:weathery/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
              padding: const EdgeInsets.all(30),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color.fromARGB(255, 153, 152, 243), Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
              )),
              child: SingleChildScrollView(
                child: Column(
                        children: [
                          const SearchField(),
                          const SizedBox(
                            height: 30,
                          ),
                          const Exploar(),
                          const SizedBox(height: 50,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                Image.asset("assets/images/start_image.png",width: 200,height: 100,),
                const Text(
                "Weather",
                style: TextStyle(
                    fontFamily: "Kadwa",
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                            ),
                            ],
                          )
                        ],
                ),
              ),
            ));
  }
}
