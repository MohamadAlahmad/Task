import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task/controllers/sharedPreferences.dart';
import 'package:task/models/user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isChecked = false;
  bool isWriting = false;
  bool isWriting2 = false;
  bool isObscure = true;

  bool ok1 = false;
  bool ok2 = false;

  final key1 = GlobalKey<FormState>();

  var eController = TextEditingController();
  var pController = TextEditingController();

  void listen() {
    if (eController.text.isNotEmpty) {
      setState(() {
        isWriting = true;
      });
    } else {
      setState(() {
        isWriting = false;
      });
    }
  }
  void listen2() {
    if (pController.text.isNotEmpty) {
      setState(() {
        isWriting2 = true;
      });
    } else {
      setState(() {
        isWriting2 = false;
      });
    }
  }

  var controller = Prefs();
  var usr = User();

  @override
  Widget build(BuildContext context) {
    eController.addListener(listen);
    pController.addListener(listen2);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 75, 20, 0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
            child: Form(
              key: key1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(
                    height: 180,
                  ),

                  /*----------------------------------------------------------*/

                  // Email
                  Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: TextFormField(
                          controller: eController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            //isDense: true,
                            suffixIcon: Image.asset(
                              'assets/icons/email.png',
                              color: isWriting
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          validator: (value) {
                            /*if(!ok1) {
                              return 'Email Wrong';
                            }
                            return null;*/
                          },
                          onChanged: (value) {
                            setState(() {
                              usr.email = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Icon(
                          isWriting ? Icons.check : null,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  // Password
                  Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: TextFormField(
                          controller: pController,
                          obscureText: isObscure,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                            hintText: 'Password',
                            //isDense: true,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/icons/key.png',
                                color: isWriting2
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          validator: (value) {
                            /*if(!ok2) {
                              return 'Password Wrong';
                            }
                            return null;*/
                          },
                          onChanged: (value) {
                            usr.password = value;
                          },
                        ),
                      ),
                      Expanded(
                        child: Icon(isWriting2 ? Icons.check : null,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),

                  /*----------------------------------------------------------*/

                  CheckboxListTile(
                    //checkbox positioned at right
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    title: Transform.translate(
                      offset: const Offset(-20, 0),
                      child: Text(
                        'Remember me',
                        style: TextStyle(
                            color: isChecked
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),

                  /*----------------------------------------------------------*/
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () async {
                        if (key1.currentState!.validate() && isChecked) {

                          usr = await controller.getValue(eController.text) as User;
                          if(usr.email!.isNotEmpty && usr.password == pController.text) {
                            //ok1 = true;
                            //ok2 = true;
                            Navigator.of(context).pushReplacementNamed('/temp');
                          }
                        }
                      },
                    ),
                  ),

                  /*----------------------------------------------------------*/

                  const SizedBox(height: 180,),
                  const Divider(thickness: 2,),
                  const SizedBox(height: 5,),
                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Create Account',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signup');
                                })
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
