// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Ticket Information", style: TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Johor -> Kuala Lumpur Sani Express RM 30 "),
            SizedBox(
              height: 10,
            ),
            Text("Johor -> Putrajaya Transnasional RM 55 "),
            SizedBox(
              height: 10,
            ),
            Text("Johor -> Perak Ali Baba Express RM 45 "),
          ],
        ),
      ),
    );
  }
}
