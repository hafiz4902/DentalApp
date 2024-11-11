import 'package:flutter/material.dart';

class MyAppointmentsPage extends StatelessWidget {
  // Contoh daftar appointment yang sudah ada (sebagai dummy data)
  final List<Map<String, String>> appointments = [
    {
      'treatment': 'Teeth Cleaning',
      'date': '2024-11-20',
      'notes': 'Regular cleaning before holiday'
    },
    {
      'treatment': 'Root Canal Treatment',
      'date': '2024-12-05',
      'notes': 'Severe pain on upper right tooth'
    },
    {
      'treatment': 'Teeth Whitening',
      'date': '2024-12-15',
      'notes': 'Preparation for special event'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Treatment
                    Text(
                      appointment['treatment']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Date
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          appointment['date']!,
                          style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Notes
                    if (appointment['notes'] != null && appointment['notes']!.isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.note, size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              appointment['notes']!,
                              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
