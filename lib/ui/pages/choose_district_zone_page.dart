import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class ChooseDistrictZonePage extends StatefulWidget {
  const ChooseDistrictZonePage({Key? key}): super(key:key);

  @override
  State<ChooseDistrictZonePage> createState() => _ChooseDistrictZonePageState();
}

class _ChooseDistrictZonePageState extends State<ChooseDistrictZonePage> {
  String dropdownvalue = 'San Isidro';
  String dropdownvalue2 = 'Zona 1';
  var districts = ['San Isidro', 'Lince', 'Miraflores', 'San Borja', 'Surco'];
  var zones = ['Zona 1', 'Zona 2', 'Zona 3', 'Zona 4', 'Zona 5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(offset: const Offset(0, -50),),
          Text('Configurar Alertas',
            style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Selecciona Ubicación',
            style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Distrito'),
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: districts.map((String districts) {
                      return DropdownMenuItem(
                        value: districts,
                        child: Text(districts),
                      );
                    }).toList(),
                  onChanged: (String? newValue) {
                      setState(() { dropdownvalue = newValue!; });
                  },
                  isExpanded: true,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Zona de Control'),
                  DropdownButton(
                    value: dropdownvalue2,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: zones.map((String zones) {
                      return DropdownMenuItem(
                        value: zones,
                        child: Text(zones),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() { dropdownvalue = newValue!; });
                    },
                    isExpanded: true,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                child: Text(
                  'Seleccionar Distrito y Zona',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent,
                  ),
                ),
                onPressed: () => _chooseDistrictAndZone(context),
                style: TextButton.styleFrom(foregroundColor: Colors.white,),
              )
            ],
          ),
        ],
      )
    );
  }
  _chooseDistrictAndZone(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}