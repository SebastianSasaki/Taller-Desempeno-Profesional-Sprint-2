import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/widgets/UpperBar.dart';

import 'home_page.dart';

class ChooseDistrictZonePage extends StatefulWidget {
  const ChooseDistrictZonePage({Key? key}): super(key:key);

  @override
  State<ChooseDistrictZonePage> createState() => _ChooseDistrictZonePageState();
}

class _ChooseDistrictZonePageState extends State<ChooseDistrictZonePage> {
  String dropdownValue = 'San Isidro';
  String dropdownValue2 = 'Zona 1';
  List<String> districts = ['San Isidro', 'Lince', 'Miraflores', 'San Borja', 'Surco'];
  List<String> zones = ['Zona 1', 'Zona 2', 'Zona 3', 'Zona 4', 'Zona 5'];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -60),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 160, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              'assets/logo.PNG',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Text(
                            'Configurar Alertas',
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: 'Escoge un distrito',
                              enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.black, width: 2), ),
                              focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.black, width: 2), ),
                              filled: true,
                              fillColor: Colors.redAccent,
                            ),
                            dropdownColor: Colors.white,
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() { dropdownValue = newValue!; });
                            },
                            items: districts.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: 'Escoge una zona',
                              enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.black, width: 2), ),
                              focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.black, width: 2), ),
                              filled: true,
                              fillColor: Colors.redAccent,
                            ),
                            dropdownColor: Colors.white,
                            value: dropdownValue2,
                            onChanged: (String? newValue) {
                              setState(() { dropdownValue2 = newValue!; });
                            },
                            items: zones.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () => _chooseDistrictAndZone(context),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                foregroundColor: Colors.redAccent,
                                backgroundColor: Colors.redAccent,
                                fixedSize: const Size(160, 56),
                                padding: const EdgeInsets.symmetric(vertical: 17)),
                            child: Text(
                              'Seleccionar Distrito y Zona',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  _chooseDistrictAndZone(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}