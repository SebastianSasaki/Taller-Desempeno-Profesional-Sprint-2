import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/alert_system.dart';
import '../widgets/UpperBar.dart';
import 'home_page.dart';

class WarningPage extends StatefulWidget {
  const WarningPage({Key? key}): super(key:key);

  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  final List<AlertSystem> alertsList = [
    AlertSystem(hour: '4:30 PM', imageAlert: 'Link 1', intervention: false),
    AlertSystem(hour: '6:30 PM', imageAlert: 'Link 2', intervention: false),
    AlertSystem(hour: '12:30 PM', imageAlert: 'Link 3', intervention: false),
    AlertSystem(hour: '1:30 PM', imageAlert: 'Link 4', intervention: false),
    AlertSystem(hour: '3:00 PM', imageAlert: 'Link 5', intervention: false),
    AlertSystem(hour: '5:19 PM', imageAlert: 'Link 6', intervention: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
      body: SizedBox(
        height: 600,
        child: PageView.builder(
          itemCount: alertsList.length,
          controller: PageController(viewportFraction: 1),
          itemBuilder: (BuildContext context, int itemIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                margin: const EdgeInsets.only(left: 10, right: 10, top: 160, bottom: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const SizedBox( height: 10,),
                      Image.network(alertsList[itemIndex].imageAlert),
                      Text(alertsList[itemIndex].hour),
                      const SizedBox( height: 20,),
                      Text(alertsList[itemIndex].intervention.toString()),
                      const SizedBox( height: 25,),
                      ElevatedButton(
                        onPressed: () => _showHome(context),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            foregroundColor: Colors.redAccent,
                            backgroundColor: Colors.redAccent,
                            fixedSize: const Size(160, 56),
                            padding: const EdgeInsets.symmetric(vertical: 17)),
                        child: Text(
                          'Intervenir',
                          style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showHome(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
  }
}