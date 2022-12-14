import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/pages/recover_password_page_2.dart';
//import 'package:tdp2/models/police.dart';

//import 'package:tdp2/ui/pages/recover_password_page_2.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin: const EdgeInsets.only( left: 10, right: 10, top: 170, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 35, vertical: 20),
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
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Recuperaci??n de Contrase??a',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Introduce tu e-mail',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Tu e-mail",
                              prefixIcon: const Icon(Icons.mail),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            obscureText: true,
                          ),
                          const SizedBox( height: 50, ),
                          ElevatedButton(
                            // funcion de cambio de contrase??a
                            onPressed: () => _showRecoverPassword2(context),
                            child: Text(
                              'Confirmar',
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.redAccent,
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
            ),
          )
        ],
      ),
    );
  }

  ///Future<void> _obtainMail(BuildContext context) async {
    ///final Police policemail = Police(policemail: _emailController);
  ///}

  _showRecoverPassword2(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecoverPassword2()));
  }
}