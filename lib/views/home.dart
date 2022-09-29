import 'package:flutter/material.dart';
import 'package:task/views/findPartner.dart';
import 'package:task/views/message.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //int selectedIndex = 0;
  int currentIndex = 0;

  final screens = [
    const Home(),
    const FindPartner(),
    const Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.headline1,),
        centerTitle: true,
        //backgroundColor: const Color(0xFFED6F1A),
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Center(
        child: Image.asset('assets/welcome.png'),
      ),
    );
  }
}
