import 'package:flutter/material.dart';
import 'package:task/views/home.dart';
import 'package:task/views/message.dart';
import 'package:task/views/suggestions.dart';
import 'package:task/views/userMessage.dart';

class Temp2 extends StatefulWidget {
  const Temp2({Key? key}) : super(key: key);

  @override
  State<Temp2> createState() => _Temp2State();
}

class _Temp2State extends State<Temp2> {

  int currentIndex = 1;

  final screens = [
    const Home(),
    const HomeSuggestion(),
    const UserMessage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      body: screens[currentIndex],
      /*bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: const Color(0x00FFFFFF),
          elevation: 0.0,
          selectedItemColor: const Color(0xFFED6F1A),
          unselectedItemColor: const Color(0xFF2D2D2E),

          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              //icon: Image.asset('assets/icons/home.png'),
              icon: Icon(Icons.home_filled, size: 40,),
              label: 'Home',
              //backgroundColor: Color(0xFFED6F1A),
            ),

            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 1 ? const Color(0xFFED6F1A) : const Color(0xFF2D2D2E),
                  ),
                  child: Image.asset('assets/icons/search-1.png', scale: 0.85,),
                ),
              ),
              label: '',
              //backgroundColor: const Color(0xFFED6F1A),
            ),

            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bxs-message-detail.png',
                color: currentIndex == 2 ?  const Color(0xFFED6F1A) : const Color(0xFF2D2D2E),
              ),
              label: 'Message',
              //backgroundColor: const Color(0xFFED6F1A),
            ),

          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),*/
    );
  }
}
