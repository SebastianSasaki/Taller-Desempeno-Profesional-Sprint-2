import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tdp2/ui/pages/view_reports_page.dart';
import 'package:tdp2/ui/widgets/UpperBar.dart';

import 'home_page.dart';

class MakeReportPage extends StatefulWidget {
  const MakeReportPage({Key? key}): super(key:key);

  @override
  State<MakeReportPage> createState() => _MakeReportPageState();
}

class _MakeReportPageState extends State<MakeReportPage> {
  String dropdownValue = 'San Isidro';
  String dropdownValue2 = 'Zona 1';
  List<String> districts = ['San Isidro', 'Lince', 'Miraflores', 'San Borja', 'Surco'];
  List<String> zones = ['Zona 1', 'Zona 2', 'Zona 3', 'Zona 4', 'Zona 5'];
  final _formKey = GlobalKey<FormState>();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 160, bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 80, width: 80,
                            child: Image.asset(
                              'assets/logo.PNG',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox( height: 40, ),
                          Text(
                            'Hacer Reporte',
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent),
                          ),
                          const SizedBox( height: 40, ),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: 'Escoge un distrito',
                              //enabledBorder: OutlineInputBorder(
                                //borderSide: BorderSide( color: Colors.black, width: 1),),
                              //focusedBorder: OutlineInputBorder(
                                //borderSide: BorderSide( color: Colors.black, width: 1),),
                              filled: true,
                              fillColor: Colors.redAccent,
                            ),
                            dropdownColor: Colors.white,
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() { dropdownValue = newValue!; });
                            },
                            items: districts.map<DropdownMenuItem<String>>((
                                String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox( height: 40, ),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              labelText: 'Escoge una zona',
                              //enabledBorder: OutlineInputBorder(
                                //borderSide: BorderSide( color: Colors.black, width: 2),),
                              //focusedBorder: OutlineInputBorder( borderSide: BorderSide( color: Colors.black, width: 2),),
                              filled: true,
                              fillColor: Colors.redAccent,
                            ),
                            dropdownColor: Colors.white,
                            value: dropdownValue2,
                            onChanged: (String? newValue) {
                              setState(() { dropdownValue2 = newValue!; });
                            },
                            items: zones.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text( value, style: const TextStyle(fontSize: 20), ),
                              );
                            }).toList(),
                          ),
                          const SizedBox( height: 30, ),
                          TableCalendar(
                            firstDay: DateTime.utc(2022, 1, 1),
                            lastDay: DateTime.utc(2050, 12, 31),
                            focusedDay: _focusedDay,
                            calendarFormat: _calendarFormat,
                            selectedDayPredicate: (day) {
                              // Use `selectedDayPredicate` to determine which day is currently selected.
                              // If this returns true, then `day` will be marked as selected.
                              // Using `isSameDay` is recommended to disregard
                              // The time-part of compared DateTime objects.
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                // Call `setState()` when updating the selected day
                                setState(() { _selectedDay = selectedDay; _focusedDay = focusedDay; });
                              }
                            },
                            onFormatChanged: (format) {
                              if (_calendarFormat != format) {
                                // Call `setState()` when updating calendar format
                                setState(() { _calendarFormat = format; });
                              }
                            },
                            onPageChanged: (focusedDay) {
                              // No need to call `setState()` here
                              _focusedDay = focusedDay;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () => _makeReport(context),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                foregroundColor: Colors.redAccent,
                                backgroundColor: Colors.redAccent,
                                fixedSize: const Size(160, 56),
                                padding: const EdgeInsets.symmetric(vertical: 17)),
                            child: Text(
                              'Hacer Reporte',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _makeReport(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewReportsPage()));
  }
}