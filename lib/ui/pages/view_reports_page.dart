import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdp2/ui/widgets/UpperBar.dart';

import '../../models/report.dart';

class ViewReportsPage extends StatefulWidget {
  const ViewReportsPage({Key? key}) : super(key: key);

  @override
  State<ViewReportsPage> createState() => _ViewReportsPageState();
}

class _ViewReportsPageState extends State<ViewReportsPage> {
  final List<Report> reportsList = [
    Report(title: 'Titulo 1', description: 'Descripción 1'),
    Report(title: 'Titulo 2', description: 'Descripción 2'),
    Report(title: 'Titulo 3', description: 'Descripción 3'),
    Report(title: 'Titulo 4', description: 'Descripción 4'),
    Report(title: 'Titulo 5', description: 'Descripción 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
      body: ListView.builder(
        itemCount: reportsList.length,
        itemBuilder: (listViewContext, index) {
          return ListTile(
            onTap: () {},
            title: Text(
                reportsList[index].title,
                style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400),
            ),
            subtitle: Text(
                reportsList[index].description,
                style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          );
        },
      )
    );
  }
}
