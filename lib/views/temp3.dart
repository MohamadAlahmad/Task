import 'package:flutter/material.dart';
import 'package:task/views/home.dart';
import 'package:task/views/message.dart';
import 'package:task/views/suggestions.dart';
import 'package:task/views/temp.dart';
import 'package:task/views/username.dart';

class Temp3 extends StatefulWidget {
  const Temp3({Key? key}) : super(key: key);

  @override
  State<Temp3> createState() => _Temp3State();
}

class _Temp3State extends State<Temp3> {

  int currentIndex = 2;
  bool ok = true;

  final screens = [
    const Temp(),
    const Suggestions(),
    const Username(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: ok? SizedBox(
        height: 120,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white.withAlpha(100),
          currentIndex: currentIndex,
          elevation: 0.0,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,

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
              //backgroundColor: const Color(0xFFED6F1A),
            ),

          ],
          onTap: (index) {
            setState(() {
              //currentIndex = index;
              if(currentIndex == 1) {
                //ok = false;
                Navigator.pushNamedAndRemoveUntil(context, '/temp', (route) => false);
              }
              if(currentIndex == 2) {
                Navigator.pushNamed(context, '/temp');
              }
            });
          },
        ),
      ) : null,
    );
  }
}
