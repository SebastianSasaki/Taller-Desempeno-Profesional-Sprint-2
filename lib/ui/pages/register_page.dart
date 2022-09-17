import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/pages/login_page.dart';

import '../../models/police.dart';
import '../../services/polices-api.services.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ScrollController _scrollController = ScrollController( initialScrollOffset: 50.0, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, -60),
            child: Center(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 260, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/logo.PNG',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          const SizedBox( height: 40, ),
                          Text(
                            'Regístro',
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent),
                          ),
                          const SizedBox( height: 40, ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textAlign: TextAlign.center,
                            autocorrect: false,
                            validator: (value) => value!.isEmpty ? 'Enter a Name' : null,
                            decoration: InputDecoration(
                              labelText: "Nombre",
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
                          const SizedBox( height: 20, ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textAlign: TextAlign.center,
                            autocorrect: false,
                            validator: (value) => value!.isEmpty ? 'Enter a Lastname' : null,
                            decoration: InputDecoration(
                              labelText: "Apellido",
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
                          const SizedBox( height: 20, ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textAlign: TextAlign.center,
                            autocorrect: false,
                            validator: (value) => value!.isEmpty ? 'Enter an email' : null,
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
                        const SizedBox( height: 20, ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.center,
                          autocorrect: false,
                          validator: (value) => value!.length < 6 ? 'Enter a password 6 characters or more' : null,
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
                        const SizedBox( height: 20, ),
                        ElevatedButton(
                          onPressed: () => _register(context),
                          child: Text(
                            'Registrarse',
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              foregroundColor: Colors.redAccent,
                              fixedSize: const Size(160, 56),
                              padding:
                              const EdgeInsets.symmetric(vertical: 17)),
                        ),
                        const SizedBox( height: 20, ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿Ya tienes una cuenta?',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Inicia Sesión',
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent
                                ),
                              ),
                              onPressed: () => _showLogin(context),
                              style: TextButton.styleFrom( foregroundColor: Theme.of(context).primaryColor, ),
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

  Future<void> _register(BuildContext context) async {
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
              Text('Registrando usuario...'),
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

      final Police userDataFromUi = Police( policename: _nameController.text, policelastname: _lastnameController.text, policemail: _emailController.text, password: _passwordController.text);
      log('input: ' + userDataFromUi.toMap().toString());
      dynamic response = await PoliceApiService().registerPolice(userDataFromUi);
      log(response);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (response.statusCode == 200) {
        log('police: ' + response.data.toString());
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => LoginPage()) );
      } else { log("Error getting police: ${response.statusCode}"); }
      _loading = false;
      return;
    }
  }

  _showLogin(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}