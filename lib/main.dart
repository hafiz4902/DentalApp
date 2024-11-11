import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/request_appointments_page.dart';
import 'screens/my_appointments_page.dart';
import 'screens/treatment_info_page.dart';
import 'screens/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dental-It',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Menggunakan named routes
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/requestAppointments': (context) => RequestAppointmentsPage(),
        '/myAppointments': (context) => MyAppointmentsPage(),
        '/treatmentInfo': (context) => TreatmentInfoPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}
