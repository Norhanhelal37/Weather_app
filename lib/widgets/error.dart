import 'package:flutter/material.dart';
import 'package:weathery/screens/home_screen.dart';

class ErrorCase extends StatelessWidget {
  const ErrorCase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
    height: double.infinity,
    width: double.infinity,
    color: const Color.fromARGB(255, 163, 199, 230),
    child:  TextButton.icon(
      icon:const Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen()));
      },
    label:const Text(  "something wrong",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.black),
    ),
                  ),
    ));
  }
}

