import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'Tataboq',
          ),
        ),
        body: const ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 3;
  int rightImageNumber = 5;

  void changeImage() {
    setState(() {
      rightImageNumber = Random().nextInt(8) + 1;
      leftImageNumber = Random().nextInt(8) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            leftImageNumber == rightImageNumber
                ? 'Congratulations, you succeeded'
                : 'Try Again',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      changeImage();
                    },
                    child: Image(
                      image: AssetImage("images/image-$leftImageNumber.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      changeImage();
                    },
                    child: Image(
                      image: AssetImage("images/image-$rightImageNumber.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
