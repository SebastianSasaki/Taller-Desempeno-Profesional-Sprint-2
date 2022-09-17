import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tdp2/ui/pages/login_page.dart';

class RecoverPassword2 extends StatefulWidget {
  const RecoverPassword2({Key? key}) : super(key: key);

  @override
  State<RecoverPassword2> createState() => _RecoverPassword2State();
}

class _RecoverPassword2State extends State<RecoverPassword2> {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: Stack(children: [
              Transform.translate(
                offset: const Offset(25, 50),
              )
            ]),
          ),
          Transform.translate(
            offset: const Offset(0, -60),
            child: Center(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 260, bottom: 20
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/logo.PNG',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Recuperación de Contraseña',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nueva Contraseña",
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Confirmar Contraseña",
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w400,),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          // funcion de cambio de contraseña
                          onPressed: () => _showLogin(context),
                          child: Text(
                            'Confirmar',
                            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w600,),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              foregroundColor: Colors.white,
                              fixedSize: const Size(160, 56),
                              padding:
                              const EdgeInsets.symmetric(vertical: 17)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //void _register(BuildContext context) {
  // in the future this will be improved
  //if ((!_loading || _loading) && _agreeWithConditions) {
  //setState(() {
  //_loading = true;
  //Navigator.of(context)
  //.push(MaterialPageRoute(builder: (context) => MyHomePage()));
  //});
  //}
  //}

  _showLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}