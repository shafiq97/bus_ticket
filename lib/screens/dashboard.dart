import 'package:bus_ticket/screens/bantuan_screen.dart';
import 'package:bus_ticket/screens/bus_screen.dart';
import 'package:bus_ticket/screens/informasi_screen.dart';
import 'package:bus_ticket/screens/login_screen.dart';
import 'package:bus_ticket/screens/lokasi_screen.dart';
import 'package:bus_ticket/screens/tentang_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.play_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff042456),
          unselectedItemColor: const Color(0xffD3DEFA),
          onTap: _onItemTapped,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.00),
                        child: Text(
                          'Hi ' + FirebaseAuth.instance.currentUser!.email!,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Book your ticket now!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 56,
                  //   width: 56,
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     borderRadius: BorderRadius.circular(8),
                  //     image: const DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: NetworkImage(
                  //         'https://blogger.googleusercontent.com/img/a/AVvXsEiRB_dB-wXqJdvt26dkR-vqOXUjacfxAQIgFNMHl_czjMNDOh6VZVc-muCczDKZh-VU0JqUYV1M9h25ZooLGqhVfwexQO6zNY1jxeMDu0-SpfEPe8xkF7re1eldAkKld9Ct1YzesFmHpQK9wlPK330AXA85gsmDBURTQm3i7r08g6vO7KNtAPyDgeUIaQ=s740',
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              courseLayout(context)
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()));
}

Widget courseLayout(BuildContext context) {
  List<String> imageFileList = [
    'book.png',
    'locate.png',
    'INFO.png',
    'about.png',
    'logout.png',
    'bantuan.png',
  ];

  var imageAction = [
    BusScreen(),
    const LokasiScreen(),
    const InformasiScreen(),
    const TentangScreen(),
    const LoginScreen(),
    const BantuanScreen(),
  ];

  return MasonryGridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    mainAxisSpacing: 27,
    crossAxisSpacing: 23,
    itemCount: imageFileList.length,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
            onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => imageAction[index]))
                },
            child: Image.asset(
              'assets/images/${imageFileList[index]}',
            )),
      );
    },
  );
}
