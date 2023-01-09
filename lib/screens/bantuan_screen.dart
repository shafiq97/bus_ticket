// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BantuanScreen extends StatelessWidget {
  const BantuanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        centerTitle: true,
      ),
      body: ListView(children: [
        Card(
            child: ListTile(
          title: Text("How to buy tickets?"),
        )),
        Card(
            child: ListTile(
          title: Text("How to check bus schedule?"),
        )),
        Card(
            child: ListTile(
          title: Text("How to pay for ticket?"),
        )),
        Card(
            child: ListTile(
          title: Text("Contact Us"),
        )),
      ]),
    );
  }
}
