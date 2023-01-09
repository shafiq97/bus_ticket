// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TentangScreen extends StatelessWidget {
  const TentangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: const [
            Text("About Us"),
            SizedBox(
              height: 15,
            ),
            Text("Online application for booking bus ticket")
          ]),
        ),
      ),
    );
  }
}
