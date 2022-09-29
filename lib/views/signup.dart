import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:task/controllers/sharedPreferences.dart';

import '../models/user.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final formKey = GlobalKey<FormState>();
  var eController = TextEditingController();
  var p1Controller = TextEditingController();
  var p2Controller = TextEditingController();
  var nController = TextEditingController();
  var aController = TextEditingController();
  var phController = TextEditingController();

  String? selectedGender;
  String? selectedCountry;
  String? selectedCity;
  String? content;

  bool notEmpty = false;
  bool isChecked = false;
  bool isWriting = false;
  bool isWriting1 = false;
  bool isWriting2 = false;
  bool isWriting3 = false;
  bool isWriting4 = false;
  bool isWriting5 = false;
  bool isObscure = true;
  bool focus = false;

  void listen() {
    if(eController.text.isNotEmpty) {
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
  void listen1() {
    if(p1Controller.text.isNotEmpty) {
      setState(() {
        isWriting1 = true;
      });
    }
    else {
      setState(() {
        isWriting1 = false;
      });
    }
  }
  void listen2() {
    if(p2Controller.text.isNotEmpty) {
      setState(() {
        isWriting2 = true;
      });
    }
    else {
      setState(() {
        isWriting2 = false;
      });
    }
  }
  void listen3() {
    if(nController.text.isNotEmpty) {
      setState(() {
        isWriting3 = true;
      });
    }
    else {
      setState(() {
        isWriting3 = false;
      });
    }
  }
  void listen4() {
    if(aController.text.isNotEmpty) {
      setState(() {
        isWriting4 = true;
      });
    }
    else {
      setState(() {
        isWriting4 = false;
      });
    }
  }
  void listen5() {
    if(phController.text.isNotEmpty) {
      setState(() {
        isWriting5 = true;
      });
    }
    else {
      setState(() {
        isWriting5 = false;
      });
    }
  }

  var user = User();

  var controller = Prefs();

  List<String> genders = ['Male', 'Female'];
  List<String> countries = ['Syria', 'Sweden', 'Germany'];
  List<String> cities1 = ['Damascus', 'Aleppo', 'Homs'];
  List<String> cities2 = ['Stockholm', 'Gothenburg', 'Malmo'];
  List<String> cities3 = ['Berlin', 'Munich', 'Hamburg'];
  List<String> cities = [];


  @override
  Widget build(BuildContext context) {
    eController.addListener(listen);
    p1Controller.addListener(listen1);
    p2Controller.addListener(listen2);
    nController.addListener(listen3);
    aController.addListener(listen4);
    phController.addListener(listen5);

    Color getTextColor(String textToBeColored) {
      if (isChecked) {
        return Theme.of(context).colorScheme.primary;
      } else {
        return Colors.black;
      }
    }

    return Scaffold(
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 75, 20, 0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(right: 20), child: Text('Signup', style: Theme.of(context).textTheme.headline2,),),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Image.asset('assets/icons/image.png', scale: 1.1,),
                    ),
                    const SizedBox(width: 10,),
                    const ImageIcon(AssetImage('assets/icons/Asset1.png'), size: 28,),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Name
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: TextFormField(
                            controller: nController,
                            decoration: const InputDecoration(
                              hintText: 'Name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                            child: Icon(isWriting3 ? Icons.check : null, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Age
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: TextFormField(
                            controller: aController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Age',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Age Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Icon(isWriting4 ? Icons.check : null, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Gender
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: DropdownButtonFormField<String>(
                            icon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                              child: Image.asset('assets/icons/arrow-down-b.png'),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                            items: genders.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Column(
                                  children: [
                                    Text(item),
                                  ],
                                ),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                                hintText: 'Gender'
                            ),
                            //isDense: true,
                            value: selectedGender,
                            isExpanded: true,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: selectedGender != null ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : const Text(''),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),
                    /*-----------------------------------------------------------------*/
                    //Country
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: DropdownButtonFormField<String>(
                            icon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                              child: Image.asset('assets/icons/arrow-down-b.png'),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                            items: countries.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                selectedCountry = value;
                                if(selectedCountry == 'Syria') {
                                  selectedCity = null;
                                  cities = cities1;
                                }
                                else if(selectedCountry == 'Sweden') {
                                  selectedCity = null;
                                  cities = cities2;
                                }
                                else if(selectedCountry == 'Germany') {
                                  selectedCity = null;
                                  cities = cities3;
                                }
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'Country'
                            ),
                            //isDense: true,
                            value: selectedCountry,
                            isExpanded: true,
                          ),
                        ),
                        Expanded(
                          child: selectedCountry != null ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : const Text(''),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //City
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: DropdownButtonFormField<String>(
                            icon: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                              child: Image.asset('assets/icons/arrow-down-b.png'),
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                            items: cities.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Column(
                                  children: [
                                    Text(item),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                selectedCity = value;
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'City'
                            ),
                            //isDense: true,
                            value: selectedCity,
                            isExpanded: true,
                          ),
                        ),
                        Expanded(
                          child: selectedCity != null ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : const Text(''),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Phone Number
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: TextFormField(
                            controller: phController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              //isDense: true,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Icon(isWriting5 ? Icons.check : null, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Email
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
                                color: isWriting? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Icon(isWriting ? Icons.check : null, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Password
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: TextFormField(
                            autofocus: focus,
                            controller: p1Controller,
                            obscureText: isObscure,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: 'Password',
                              //isDense: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  'assets/icons/key.png',
                                  color: isWriting1? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password Required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Icon(isWriting1 ? Icons.check : null, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Reenter password
                    Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: TextFormField(
                            controller: p2Controller,
                            obscureText: isObscure,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Reenter password',
                              //isDense: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  'assets/icons/key.png',
                                  color: isWriting2? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password Required';
                              }
                              if(value != p1Controller.text) {
                                return 'Enter again !';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                if(p1Controller.text.isEmpty && p2Controller.text.isNotEmpty) {
                                  focus = true;
                                  p2Controller.text = '';
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Icon(isWriting2 ? Icons.check : null, color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    //Accept Terms & Services
                    CheckboxListTile(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      title: Transform.translate(
                        offset: const Offset(-20, 0),
                        child: RichText(
                          text: TextSpan(
                              text: 'Accept the ',
                              style: TextStyle(
                                  color: getTextColor('Accept the '),
                                  fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'Terms & Services',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: getTextColor('Terms & Services'),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pushReplacementNamed('/login');
                                      }
                                )
                              ]
                          ),
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),

                    // Signup Button
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: ElevatedButton(
                        child: const Text('Signup',),
                        onPressed: () async {
                          if(formKey.currentState!.validate() && isChecked) {

                            setState(() {
                              user = User(
                                  name: nController.text,
                                  age: int.parse(aController.text),
                                  gender: selectedGender,
                                  country: selectedCountry,
                                  city: selectedCity,
                                  phone: int.parse(phController.text),
                                  email: eController.text,
                                  password: p1Controller.text
                              );
                            });

                            await controller.setValue(user, '${user.email}');

                            /*---------------------------------------------*/
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                              transitionDuration: const Duration(milliseconds: 200),
                              pageBuilder: (BuildContext context, Animation first, Animation second) {
                                return Center(
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 10.0),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height,
                                        padding: const EdgeInsets.fromLTRB(50, 150, 50, 100),
                                        color: Colors.white.withOpacity(0.5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                  text: '        Sign in!\n\n',
                                                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(text: '        Please sign in\nto continue to the app.',
                                                        style: const TextStyle(fontSize: 20,),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {}
                                                    )
                                                  ]
                                              ),
                                            ),
                                            const SizedBox(height: 20,),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pushNamed('/login');
                                              },
                                              child: const Text('Done',),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            /*---------------------------------------------*/

                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 70,),
                    const Divider(thickness: 2,),
                    const SizedBox(height: 10,),

                    RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.secondary),
                          children: <TextSpan>[
                            TextSpan(text: 'Login',
                                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/login');
                                  }
                            )
                          ]
                      ),
                    ),

                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAlert(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.warning, color: Colors.red, size: 25.0,),
              SizedBox(width: 10.0),
              Text('Warning', style: TextStyle(fontSize: 25.0, color: Colors.red),),
            ],
          ),
          content: Text(text),
          actions: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.deepOrange,
              child: const Text('OK', style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}
