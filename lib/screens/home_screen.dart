import 'package:flutter/material.dart';
import '../widgets/image_slider.dart';
import '../widgets/option_widget.dart';
import 'my_appointments_page.dart';
import 'request_appointments_page.dart';
import 'search_page.dart';
import 'treatment_info_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dental-It',
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.blue[900], size: 28),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined,
                color: Colors.blue[900], size: 28),
            onPressed: () {
              // Memastikan bahwa modal dialog muncul
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Notifications"),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.notification_important,
                                color: Colors.blue[900]),
                            title: Text(
                                "Your appointment is tomorrow at 10:00 AM"),
                            subtitle: Text(
                                "Don't forget to confirm your attendance."),
                          ),
                          ListTile(
                            leading: Icon(Icons.notification_important,
                                color: Colors.blue[900]),
                            title: Text("New dental tips available"),
                            subtitle: Text(
                                "Read our latest article on maintaining oral hygiene."),
                          ),
                          ListTile(
                            leading: Icon(Icons.notification_important,
                                color: Colors.blue[900]),
                            title: Text("Appointment with Dr. Smith confirmed"),
                            subtitle:
                                Text("Check the details of your appointment."),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header with User Info
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              accountName: Text('Hafiz Erpindra Septianu'),
              accountEmail: Text('septianuh@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'H',
                  style: TextStyle(fontSize: 40.0, color: Colors.blue[900]),
                ),
              ),
            ),
            // Logout Option
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Tambahkan fungsi log out di sini
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to log out?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // Log out action here
                            Navigator.of(context).pop();
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Image slider
          ImageSlider(
            imageUrls: [
              'https://th.bing.com/th/id/OIP.aXxjqnLwvOYp3wu04MmiHAHaE8?rs=1&pid=ImgDetMain',
              'https://cdn.create.vista.com/downloads/2ffa2cf4-6bbe-4c29-9b2f-a2e76f3a2cfd_1024.jpeg',
              'https://th.bing.com/th/id/OIP.YUngeAx-erWpu9PlIC79SwHaFj?w=240&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
            ],
          ),
          const SizedBox(height: 20),
          // Grid of options
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                OptionWidget(
                  icon: Icons.add_circle_outline,
                  label: 'Request Appointments',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestAppointmentsPage()),
                    );
                  },
                ),
                OptionWidget(
                  icon: Icons.assignment_outlined,
                  label: 'My Appointments',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyAppointmentsPage()),
                    );
                  },
                ),
                OptionWidget(
                  icon: Icons.info_outline,
                  label: 'Treatment Info',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TreatmentInfoPage()),
                    );
                  },
                ),
                OptionWidget(
                  icon: Icons.search,
                  label: 'Search',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
