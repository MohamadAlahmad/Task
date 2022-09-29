import 'package:flutter/material.dart';

class Ask extends StatefulWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  State<Ask> createState() => _AskState();
}

class _AskState extends State<Ask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(8),alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Please login to continue', style: Theme.of(context).textTheme.headline2,),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const Text('Login',),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Theme.of(context).colorScheme.primary),
                    primary: Theme.of(context).colorScheme.onPrimary,
                    onPrimary: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text('Signup'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
