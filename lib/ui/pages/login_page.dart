import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tdp_sprint_2/models/police.dart';
import 'package:tdp_sprint_2/services/polices-api.services.dart';
import 'package:tdp_sprint_2/ui/pages/register_page.dart';
import 'package:tdp_sprint_2/ui/pages/recover_password_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final _policenameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                        left: 10, right: 10, top: 260, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/logo.PNG',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Iniciar Sesión',
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _policenameController,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@') ||
                                  value.startsWith('@') ||
                                  value.endsWith('@') ||
                                  value.length < 3) {
                                return 'Por favor ingrese su correo electrónico';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Correo",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su contraseña';
                              }
                              if (value.length < 8) {
                                return 'Debe tener mínimo 8 caracteres';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ElevatedButton(
                            onPressed: () => _login(context),
                            child: Text(
                              'Ingresar',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPrimary: Colors.redAccent,
                                fixedSize: const Size(160, 56),
                                padding:
                                const EdgeInsets.symmetric(vertical: 17)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              onPressed: () => _showRecoverPassword(context),
                              style: TextButton.styleFrom(
                                primary: Theme
                                    .of(context)
                                    .primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text(
                                  'Regístrate',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.redAccent
                                  ),
                                ),
                                onPressed: () => _showRegister(context),
                                style: TextButton.styleFrom(
                                  // Text color
                                  primary: Theme
                                      .of(context)
                                      .primaryColor,
                                ),
                              )
                            ],
                          )
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

  Future<void> _login(BuildContext context) async {
    if (!_loading) {
      _loading = true;
      if (!_formKey.currentState!.validate()) {
        _loading = false;
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Iniciando sesión...'),
              SizedBox(
                width: 100,
              ),
              SizedBox(
                child: CircularProgressIndicator(),
                width: 20,
                height: 20,
              ),
            ],
          ),
          duration: const Duration(seconds: 100),
        ),
      );

      final Police policeDataFromUi = Police(
          policename: _policenameController.text,
          password: _passwordController.text);

      log('input: ' + policeDataFromUi.toMap().toString());

      dynamic response = await PoliceApiService().login(policeDataFromUi);
      log(response);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (response.statusCode == 200) {
        log('police: ' + response.data.toString());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        log("Error getting police: ${response.statusCode}");
      }
      _loading = false;
      return;
    }
  }

  _showRegister(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  _showRecoverPassword(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => RecoverPassword()));
  }
}