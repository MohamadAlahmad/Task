import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';


class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  ///////////////////////////////////////////////////////
  String? text = '';
  var u1 = User();
  var u2 = User();
  SharedPreferences? prefs;

  void getValues() async {
    prefs = await SharedPreferences.getInstance();
    try {

      final userAsJson = prefs!.getString('u1');
      u2 = User.fromJason(json.decode(userAsJson!));

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nothing found !')));
    }

  }
  ///////////////////////////////////////////////////////

  final formKey = GlobalKey<FormState>();
  var nController = TextEditingController();
  String? selectedGender;
  String? content;
  bool notEmpty = false;
  bool isChecked = false;
  bool isWriting3 = false;
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
    u1.name = nController.text;
  }
  List<String> genders = ['Male', 'Female'];

  @override
  void initState() {
    getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nController.addListener(listen3);

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
              Padding(padding: const EdgeInsets.only(right: 20), child: Text('$User: ${u2.name}, Gender : ${u2.gender}', style: Theme.of(context).textTheme.headline2,),),
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
                            onChanged: (value){
                              setState(() {

                              });
                            },
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
                            onChanged: (value){
                              setState(() {
                                selectedGender = value;
                                u1.gender = value;
                              });
                            },
                            decoration: const InputDecoration(
                                hintText: 'Gender'
                            ),
                            //isDense: true,
                            value: selectedGender,
                            isExpanded: true,
                          ),
                        ),
                        Expanded(
                          child: selectedGender != null ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : const Text(''),
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
                                        // navigate to desired screen
                                      }
                                )
                              ]
                          ),
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Theme.of(context).colorScheme.primary,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: ElevatedButton(
                        child: const Text('Signup',),
                        onPressed: () async {
                          if(formKey.currentState!.validate() && isChecked) {
                            final u1AsJson = json.encode(u1.toJason());
                            prefs!.setString('u1', u1AsJson);
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
