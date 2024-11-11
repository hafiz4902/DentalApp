import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Contoh data yang tersedia untuk pencarian (dummy data)
  final List<Map<String, String>> data = [
    {'title': 'Teeth Cleaning', 'description': 'A regular cleaning procedure to maintain oral hygiene.'},
    {'title': 'Tooth Extraction', 'description': 'Procedure to remove damaged or decayed tooth.'},
    {'title': 'Dental Filling', 'description': 'Treatment to repair cavities and restore tooth functionality.'},
    {'title': 'Teeth Whitening', 'description': 'Cosmetic treatment to whiten teeth.'},
    {'title': 'Root Canal Treatment', 'description': 'Procedure to treat infected root canal and save tooth.'},
  ];

  // Variabel untuk menyimpan hasil pencarian dan kata kunci
  List<Map<String, String>> _searchResults = [];
  final _searchController = TextEditingController();

  // Fungsi untuk melakukan pencarian berdasarkan kata kunci
  void _search(String query) {
    final results = data.where((item) {
      final title = item['title']!.toLowerCase();
      final description = item['description']!.toLowerCase();
      final input = query.toLowerCase();

      return title.contains(input) || description.contains(input);
    }).toList();

    setState(() {
      _searchResults = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text field untuk pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search treatments, appointments, etc.',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: _search,
            ),
            const SizedBox(height: 20),

            // Menampilkan hasil pencarian dalam bentuk list
            Expanded(
              child: _searchResults.isEmpty
                  ? Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final item = _searchResults[index];
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
                                // Judul treatment
                                Text(
                                  item['title']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Deskripsi treatment
                                Text(
                                  item['description']!,
                                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
