import 'package:flutter/material.dart';
import 'utilities.dart';
import 'vsjthree.dart';

class VsjTwo extends StatefulWidget {
  _VsjTwo createState() {
    return _VsjTwo();
  }
}

class _VsjTwo extends State<VsjTwo> with SingleTickerProviderStateMixin {
  Animation animation;
  String data = "";
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("VSJ Two"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context,'/three');
              },
              child: Text('Go to VSJ three'),
            ),
          ),
          Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,'/');
            },
            child: Text('Go back to VSJ one'),
          ),
          ),
          Hero(
            tag: 'logo',
            child: Center(
              child:
                  Image(height: 200, image: NetworkImage(Utilities.imagepath)),
            ),
          ),
          Text(data),
          Image(
            image: NetworkImage(Utilities.imagepath),
            height: 200,
          ),
          ElevatedButton(
            onPressed: () {
              animation = ColorTween(begin: Colors.blue, end: Colors.red)
                  .animate(controller);
              controller.reset();
              controller.forward();
              setState(() {});
            },
            child: Text(
              "Animate",
              style: TextStyle(backgroundColor: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
