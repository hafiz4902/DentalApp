import 'package:flutter/material.dart';

class RequestAppointmentsPage extends StatefulWidget {
  @override
  _RequestAppointmentPageState createState() => _RequestAppointmentPageState();
}

class _RequestAppointmentPageState extends State<RequestAppointmentsPage> {
  // Daftar treatment yang tersedia
  final List<String> treatments = [
    'Teeth Cleaning',
    'Tooth Extraction',
    'Dental Filling',
    'Teeth Whitening',
    'Root Canal Treatment'
  ];

  // Kontrol untuk dropdown dan date picker
  String? _selectedTreatment;
  DateTime? _selectedDate;
  final _noteController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submitAppointment() {
    if (_selectedTreatment == null || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Proses untuk mengirim data appointment
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Appointment Requested Successfully')),
    );

    // Reset form
    setState(() {
      _selectedTreatment = null;
      _selectedDate = null;
      _noteController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Request Appointment'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pilihan treatment
            Text(
              'Select Treatment:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              value: _selectedTreatment,
              hint: Text('Choose a treatment'),
              onChanged: (value) {
                setState(() {
                  _selectedTreatment = value;
                });
              },
              items: treatments.map((treatment) {
                return DropdownMenuItem(
                  value: treatment,
                  child: Text(treatment),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Pilihan tanggal
            Text(
              'Select Date:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _selectedDate != null
                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                      : 'Choose a date',
                  style: TextStyle(
                    color: _selectedDate != null ? Colors.black : Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Catatan tambahan
            Text(
              'Additional Notes:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Add any specific notes (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol untuk mengirim permintaan appointment
            Center(
              child: ElevatedButton(
                onPressed: _submitAppointment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: screenWidth * 0.3,
                  ),
                ),
                child: Text(
                  'Submit Appointment',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
