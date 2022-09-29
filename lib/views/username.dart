import 'package:flutter/material.dart';

class Username extends StatefulWidget {
  const Username({Key? key}) : super(key: key);

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {

  var myController = TextEditingController();
  bool isWriting = false;

  void listen() {
    if(myController.text.isNotEmpty) {
      setState(() {
        isWriting = true;
      });
    }
    else {
      setState(() {
        isWriting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    myController.addListener(listen);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: Text('User name', style: Theme.of(context).textTheme.headline1),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.center , child: Text('YESTERDAY, 2:30 PM', style: TextStyle(color: Theme.of(context).colorScheme.secondary),)),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                margin: const EdgeInsets.fromLTRB(0, 10, 80, 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Aliquam convallis felis a sem aliquet, vel dictum dui varius.',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                margin:const  EdgeInsets.fromLTRB(80, 10, 0, 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: const Text('Aliquam convallis felis a sem aliquet, vel dictum dui varius.'),
              ),
              Align(alignment: Alignment.center , child: Text('YESTERDAY, 7:43 PM', style: TextStyle(color: Theme.of(context).colorScheme.secondary),)),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 80, 15),
                margin: const EdgeInsets.fromLTRB(0, 10, 80, 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Fusce ornare fringilla varius.',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 80, 15),
                margin: const EdgeInsets.fromLTRB(80, 10, 0, 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: const Text('Nullam volutpat purus augue'),
              ),
              const SizedBox(height: 185,),
              Material(
                elevation: 7.0,
                shadowColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    hintText: 'Write a message ...',
                    hintStyle: const TextStyle(fontSize: 18),
                    suffixIcon: Image.asset(
                      'assets/icons/Path-1.png',
                      color: isWriting? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
