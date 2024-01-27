import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> searchResults = [];

  void fetchSearchData(String query) {
    searchResults = mockFetchSearchData(query);
  }

  List<String> mockFetchSearchData(String query) {

    return List.generate(10, (index) => 'Result $index for $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (query) {
                fetchSearchData(query);
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter your search query',
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]),
                    // Add more details or actions as needed
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