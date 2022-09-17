import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/widgets/UpperBar.dart';
import 'package:tdp2/ui/pages/change_district_zone_page.dart';
import 'package:tdp2/ui/pages/warnings_page.dart';

User? loggedinUser;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

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
                onPressed: () => _warnings(context),
                child: Text(
                  'Alertas',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              ),
              ElevatedButton(
                onPressed: () => null,
                child: Text(
                  'Generar Reportes',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              ),
              ElevatedButton(
                onPressed: () => _showChangeDistrictAndZone(context),
                child: Text(
                  'Configurar Zona de Control',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              ),
              ElevatedButton(
                onPressed: () => null,
                child: Text(
                  'Reportar fallos',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              )
            ],
          ),
        ],
      ),
    );
  }

  _showChangeDistrictAndZone(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeDistrictZonePage()));
  }

  _warnings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WarningPage()));
  }
}