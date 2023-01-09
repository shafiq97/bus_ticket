// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/bus.dart';
import 'detail_order.dart';

class ChooseSeat extends StatefulWidget {
  double ticket_price = 0;
  int totalSeat = 0;
  Bus bus;
  ChooseSeat(
      {Key? key,
      required this.ticket_price,
      required this.totalSeat,
      required this.bus})
      : super(key: key);

  @override
  State<ChooseSeat> createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  int row = 0;
  List letter = ["A", "B", "", "C", "D", "E"];
  List? dataSeat;
  List bookedSeat = [];
  List selectedSeat = [];
  // List seatHide = ["A1", "E2", "D15", "E15"]; //use A1-E1 etc
  List seatHide = []; //use A1-E1 etc
  double ticketPrice = 0;

  @override
  void initState() {
    super.initState();
    ticketPrice = widget.ticket_price;
    row = widget.totalSeat ~/ 5;
    dataSeat = List.generate(row, (index) => index).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text("Choose Seat"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.network(
                          "https://static.thenounproject.com/png/854894-200.png",
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Available")
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.network(
                          "https://static.thenounproject.com/png/854894-200.png",
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Selected")
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.network(
                          "https://static.thenounproject.com/png/854894-200.png",
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Booked")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      letter.length,
                      (index) {
                        return Column(
                          children: [
                            Container(
                              child: Text(letter.elementAt(index)),
                            ),
                            for (var dataTemp in dataSeat!)
                              Container(
                                child: index == 2
                                    ? Container(
                                        margin: EdgeInsets.all(5),
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            (dataTemp + 1).toString(),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          selectSeat(
                                              "${letter.elementAt(index)}${dataTemp + 1}");
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 40,
                                          width: 40,
                                          child: isSeatHidden(
                                                  "${letter.elementAt(index)}${dataTemp + 1}")
                                              ? null
                                              : Image.network(
                                                  "https://static.thenounproject.com/png/854894-200.png",
                                                  color: colorStatusSeat(
                                                      "${letter.elementAt(index)}${dataTemp + 1}"),
                                                ),
                                        ),
                                      ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: selectedSeat.isNotEmpty ? null : 0,
        duration: Duration(microseconds: 200),
        curve: Curves.linear,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              spreadRadius: 8,
              blurRadius: 9,
              offset: Offset(0, 2), // changes position of shadow
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSeat.clear();
                  });
                },
                child: Text(
                  "Clear all",
                  style: TextStyle(
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Selected Seat",
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                  Spacer(),
                  for (var tempSeat in selectedSeat..sort())
                    Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            "https://static.thenounproject.com/png/854894-200.png",
                            scale: 6,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            tempSeat,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "RM ${NumberFormat('#,###', 'id_ID').format((selectedSeat.length * ticketPrice))}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                booking();
              },
              child: Text(
                "Booking",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectSeat(id) {
    setState(() {
      if (selectedSeat.contains(id)) {
        selectedSeat.removeWhere((element) => element == id);
      } else {
        if (!bookedSeat.contains(id)) {
          selectedSeat.add(id);
        }
      }
    });
  }

  booking() {
    setState(() {
      bookedSeat.addAll(selectedSeat);
      selectedSeat.clear();
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailOrder(
                bus: widget.bus,
                bookedSeat: bookedSeat,
              )),
    );
  }

  bool isSeatHidden(id) {
    return seatHide.contains(id);
  }

  Color colorStatusSeat(id) {
    Color tempColor = Theme.of(context).colorScheme.secondary;
    if (selectedSeat.contains(id)) {
      tempColor = Theme.of(context).colorScheme.primary;
    } else if (bookedSeat.contains(id)) {
      tempColor = Theme.of(context).disabledColor;
    }
    return tempColor;
  }
}
