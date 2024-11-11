import 'package:flutter/material.dart';

class TreatmentInfoPage extends StatelessWidget {
  final List<Map<String, String>> treatments = [
    {
      'title': 'Teeth Cleaning',
      'description': 'Prosedur pembersihan gigi dari plak dan karang gigi.',
      'image': 'https://dentalhealthsociety.com/wp-content/uploads/deep-cleaning-teeth-before-and-after.jpg'  
    },
    {
      'title': 'Tooth Extraction',
      'description': 'Pengangkatan gigi yang rusak atau terinfeksi.',
      'image': 'https://www.wrfdc.com/wp-content/uploads/2022/08/AdobeStock_298746307.jpg'
    },
    {
      'title': 'Dental Filling',
      'description': 'Perawatan untuk menambal gigi yang berlubang.',
      'image': 'https://th.bing.com/th/id/OIP.Bxc2omuBVLDP1heMyEaInAHaFj?rs=1&pid=ImgDetMain'
    },
    {
      'title': 'Teeth Whitening',
      'description': 'Proses memutihkan gigi agar tampak lebih cerah.',
      'image': 'https://th.bing.com/th/id/OIP.vPSLMvuOQCahe_dwueowigHaEo?rs=1&pid=ImgDetMain'
    },
    {
      'title': 'Root Canal Treatment',
      'description': 'Perawatan saluran akar gigi yang terinfeksi.',
      'image': 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhIaMZIGXhg02UiZ5FxFGXa_DmORx23GEyUJpNzsnZ_sTUwqyKAwz69ysU5bijfBMG8EAZYR2gDFErb4nNfEXvawN4tBML2w24rKhEGG_ir1SNgeM9cwf-59kwZf4oaYg5YcE2cbnjsQmZfAWyzrcxu-MIXlNkt5zPt3zTcM7yrMrBV0ZTo2YvueqUIdg/w1200-h630-p-k-no-nu/root-canal-procedure-demonstration.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Treatment Info',
          style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blue[900]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: treatments.length,
          itemBuilder: (context, index) {
            final treatment = treatments[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      treatment['image']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 180,
                          color: Colors.grey[300],
                          child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          treatment['title']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          treatment['description']!,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TreatmentInfoPage(),
  ));
}
