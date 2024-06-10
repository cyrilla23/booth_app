import 'package:flutter/material.dart';

void main() {
  runApp(HomeBoothApp());
}

class HomeBoothApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Booth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> booths = [
    {
      'name': 'Bee',
      'description': 'Description for Bee',
      'image': 'lebah.JPG'
    },
    {
      'name': 'people',
      'description': 'Description for Booth 2',
      'image': 'people.PNG'
    },
    {
      'name': 'flower',
      'description': 'Description for Booth 3',
      'image': 'flower.JPEG'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Booth List'),
      ),
      body: ListView.builder(
        itemCount: booths.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                booths[index]['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(booths[index]['name']!),
              subtitle: Text(booths[index]['description']!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BoothDetailScreen(booth: booths[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BoothDetailScreen extends StatelessWidget {
  final Map<String, String> booth;

  BoothDetailScreen({required this.booth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(booth['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              booth['image']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              booth['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              booth['description']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
