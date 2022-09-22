import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/UpperBar.dart';

class WarningPage extends StatefulWidget {
  const WarningPage({Key? key}): super(key:key);

  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -50),
          ),
          Center(
            child: Text(
            'Alertas',
            style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.redAccent),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Hora: '),
                  Text('Hora Random'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Intervenido: '),
                  Text('Si o No'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}