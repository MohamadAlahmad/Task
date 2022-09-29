import 'package:flutter/material.dart';

class FindPartner extends StatefulWidget {
  const FindPartner({Key? key}) : super(key: key);

  @override
  State<FindPartner> createState() => _FindPartnerState();
}

class _FindPartnerState extends State<FindPartner> {

  List<String> genders = ['Male', 'Female'];
  List<String> countries = ['Syria', 'Sweden', 'Germany'];
  List<String> cities1 = ['Damascus', 'Aleppo', 'Homs'];
  List<String> cities2 = ['Stockholm', 'Gothenburg', 'Malmo'];
  List<String> cities3 = ['Berlin', 'Munich', 'Hamburg'];
  List<String> cities = [];
  String? selectedGender;
  String? selectedCountry;
  String? selectedCity;

  /*int currentIndex = 1;*/



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Find a partner', style: Theme.of(context).textTheme.headline1,),
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /*---------------------------------------------------------*/
              DropdownButtonFormField<String>(
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
                    if(selectedCountry == "Syria") {
                      cities = cities1;
                    }
                    else if(selectedCountry == "Sweden") {
                      cities = cities2;
                    }
                    else if(selectedCountry == "Germany") {
                      cities = cities3;
                    }
                  });
                },
                decoration: const InputDecoration(
                    hintText: 'Country'
                ),
                isDense: true,
                value: selectedCountry,
                isExpanded: true,
              ),

              /*----------------------------------------------------------------*/

              const SizedBox(height: 10,),

              DropdownButtonFormField<String>(
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
                isDense: true,
                value: selectedCity,
                isExpanded: true,
              ),

              /*----------------------------------------------------------------*/

              const SizedBox(height: 10,),

              DropdownButtonFormField<String>(
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
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Partner\'s gender',
                ),
                isDense: true,
                value: selectedGender,
                isExpanded: true,
              ),

              /*----------------------------------------------------------------*/

              const SizedBox(height: 10,),

              const Text('Partner\'s age :', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

              const SizedBox(height: 10,),

              /*----------------------------------------------------------------*/

              Row(
                children: [
                  const Expanded(child: Text('Between', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 75, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Age',
                          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                          //isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1.5,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Expanded(child: Text('And', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 75, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Age',
                          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                          //isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1.5,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /*----------------------------------------------------------------*/

              const SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Date: / /',
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1.5,),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: Image.asset('assets/icons/calendar-date-fill.png'),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age Required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15,),

              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/search-1.png'),
                    const SizedBox(width: 7,),
                    const Text('Search',),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/temp2',);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

