import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/widgets/UpperBar.dart';

import 'home_page.dart';

class ReportFailurePage extends StatefulWidget {
  const ReportFailurePage({Key? key}) : super(key: key);

  @override
  State<ReportFailurePage> createState() => _ReportFailurePageState();
}

class _ReportFailurePageState extends State<ReportFailurePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
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
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 160, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 80, width: 80,
                            child: Image.asset(
                              'assets/logo.PNG',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 50,),
                          Text(
                            'Reportar Fallo',
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(height: 40,),
                          TextFormField(
                            controller: _titleController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textAlign: TextAlign.center,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su título del fallo';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Título del fallo",
                              prefixIcon: const Icon(Icons.abc),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                            ),
                            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400,),
                          ),
                          const SizedBox(height: 40,),
                          TextFormField(
                            controller: _descriptionController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            textAlign: TextAlign.center,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese descripción del fallo';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Descripcion del fallo",
                              prefixIcon: const Icon(Icons.abc),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                            ),
                            style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400,),
                          ),
                          const SizedBox(height: 70,),
                          ElevatedButton(
                            onPressed: () => _showHome(context),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                foregroundColor: Colors.redAccent,
                                backgroundColor: Colors.redAccent,
                                fixedSize: const Size(160, 60),
                                padding: const EdgeInsets.symmetric(vertical: 17)),
                            child: Text(
                              'Enviar',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _showHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
