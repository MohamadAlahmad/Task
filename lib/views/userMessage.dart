import 'package:flutter/material.dart';
import 'package:task/views/home.dart';
import 'package:task/views/suggestions.dart';
import 'package:task/views/username.dart';

class UserMessage extends StatefulWidget {
  const UserMessage({Key? key}) : super(key: key);

  @override
  _UserMessageState createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ooops!',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
            Text('No messages yet.',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),),
          ],
        ),
      ),
    );
  }
}



