import 'package:flutter/material.dart';
import 'package:task/views/findPartner.dart';
import 'package:task/views/home.dart';
import 'package:task/views/message.dart';
import 'package:task/views/userMessage.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {

  //bool isSelected = false;
  int currentIndex = 0;

  final screens = [
    const Home(),
    const FindPartner(),
    const UserMessage(),
    //const Suggestions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white.withAlpha(100),
          currentIndex: currentIndex,
          elevation: 0.0,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),

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
                    color: currentIndex == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
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
                color: currentIndex == 2 ?  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
              ),
              label: 'Message',
            ),

          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });

          },
        ),
      ),
    );
  }
}
