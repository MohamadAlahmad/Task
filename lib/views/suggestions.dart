import 'package:flutter/material.dart';
import 'package:task/views/home.dart';
import 'package:task/views/message.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  /*int currentIndex = 1;
  final screens = [
    const Home(),
    const Suggestions(),
    const Message(),
  ];*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        title: Text('Suggestions partners', style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {Navigator.of(context).pop();},
          icon: Image.asset('assets/icons/back.png'),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Item();
        },
      ),

      /*bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
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
              //if(currentIndex != 1) {
                //selected = false;
              //}
            });
          },
        ),
      ),*/
    );
  }
}


class HomeSuggestion extends StatefulWidget {
  const HomeSuggestion({Key? key}) : super(key: key);

  @override
  State<HomeSuggestion> createState() => _HomeSuggestionState();
}

class _HomeSuggestionState extends State<HomeSuggestion> {
  int currentIndex = 1;
  final screens = [
    const Home(),
    const Suggestions(),
    const HomeMessage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white.withAlpha(100),
          elevation: 0.0,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: const Color(0xFF2D2D2E),

          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: 40,),
              label: 'Home',
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





class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0,),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),// هون حدد قديش بدك ترفع لفوق منشان زر الـ Message
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow( //const Color(0xFF2D2D2E)
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.5,),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset('assets/icons/image.png', scale: 0.95,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Partner\'s name', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      Text('Age: xx', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('Restaurant name: Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 140, 10, 0), // هون حدد كم سوف تنزل زر الـ Message
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/message');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/bxs-message-detail.png', color: Theme.of(context).colorScheme.onPrimary, scale: 1.5,),
                    const SizedBox(width: 20,),
                    const Text('Send a message', style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

