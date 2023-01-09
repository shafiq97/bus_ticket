// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:bus_ticket/model/bus.dart';
import 'package:bus_ticket/screens/payment.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

class DetailOrder extends StatefulWidget {
  Bus bus;
  List bookedSeat = [];
  DetailOrder({super.key, required this.bus, required this.bookedSeat});

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  var uuid = Uuid().v1().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text("ID " + uuid),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Image.network(
                      "https://img.icons8.com/external-konkapp-detailed-outline-konkapp/512/external-bus-transportation-konkapp-detailed-outline-konkapp.png",
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                        // ignore: prefer_const_literals_to_create_immutables
                        stops: [0.5, 0.5],
                        colors: <Color>[
                          Theme.of(context).colorScheme.primary,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DottedLine(),
                        Align(
                          alignment: Alignment(-1.05, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(1.07, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "From",
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bus.asal,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bus.time,
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bus.date,
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.network(
                                  "https://img.icons8.com/external-konkapp-detailed-outline-konkapp/512/external-bus-transportation-konkapp-detailed-outline-konkapp.png",
                                  scale: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "To",
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bus.tujuan,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bus.arrival,
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bus.date,
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  FirebaseAuth.instance.currentUser!.email!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Seat",
                                  style: TextStyle(
                                    color: Color(0xFFAAAAAA),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.bookedSeat.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DottedLine(),
                        Align(
                          alignment: Alignment(-1.05, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(1.07, 0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: QrImage(
                        data: uuid,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreditCard(),
                              ));
                        },
                        child: Text("PAY"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
