import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp_sprint_2/ui/widgets/UpperBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
      body: Stack(
        children: [
          const SizedBox(
            height: 60,
          ),
          GridView.count(crossAxisSpacing: 10.0, mainAxisSpacing: 10.0, crossAxisCount: 2,
            children: [
              ElevatedButton(
                onPressed: () => null,
                child: Text(
                  'Alertas',
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPrimary: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              ),
              ElevatedButton(
                onPressed: () => null,
                child: Text(
                  'Generar Reportes',
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPrimary: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              ),
              ElevatedButton(
                onPressed: () => null,
                child: Text(
                  'Configurar Zona de Control',
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPrimary: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              ),
              ElevatedButton(
                onPressed: () => null,
                child: Text(
                  'Reportar fallos',
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPrimary: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              )
            ],
          ),
        ],
      ),
    );
  }
}