import 'package:flutter/material.dart';
import 'package:task/views/home.dart';
import 'package:task/views/suggestions.dart';
import 'package:task/views/username.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.headline1,),
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Item();
          },
        ),
      ),
    );
  }
}

/*----------------------------------------------------------------------------*/

class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            border: Border.all(width: 2.5,),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Image.asset('assets/icons/image.png', scale: 1.1,),
        ),
        title: const Text('User name', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
        subtitle: const Text('Message content', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        trailing: const Text('dd/mm/yyyy'),
        visualDensity: const VisualDensity(vertical: 4),
        onTap: () {
          Navigator.of(context).pushNamed('/temp3');
        },
      ),
    );
  }
}

/*----------------------------------------------------------------------------*/

class HomeMessage extends StatefulWidget {
  const HomeMessage({Key? key}) : super(key: key);

  @override
  State<HomeMessage> createState() => _HomeMessageState();
}

class _HomeMessageState extends State<HomeMessage> {
  int currentIndex = 2;
  final screens = [
    const Home(),
    const Suggestions(),
    const Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0x00FFFFFF),
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
              currentIndex = index;
              //if(currentIndex != 1) {
              //selected = false;
              //}
            });
          },
        ),
      ),
    );
  }
}



