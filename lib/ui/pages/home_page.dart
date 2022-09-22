import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/widgets/UpperBar.dart';
import 'package:tdp2/ui/pages/change_district_zone_page.dart';
import 'package:tdp2/ui/pages/warnings_page.dart';

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
      body: Center(
        child: GridView.count(
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: [
            ElevatedButton(
              onPressed: () => _warnings(context),
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              child: Text(
                'Alertas',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
              ),
            ),
            ElevatedButton(
              onPressed: () => null,
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              child: Text(
                'Generar Reportes',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
              ),
            ),
            ElevatedButton(
              onPressed: () => _showChangeDistrictAndZone(context),
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              child: Text(
                'Configurar Zona de Control',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
              ),
            ),
            ElevatedButton(
              onPressed: () => null,
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.redAccent, fixedSize: const Size(160, 56), padding: const EdgeInsets.symmetric(vertical: 17)),
              child: Text(
                'Reportar fallos',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black,),
              ),
            )
          ],
        ),
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