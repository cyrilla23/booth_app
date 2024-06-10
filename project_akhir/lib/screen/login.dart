import 'package:flutter/material.dart';
import 'package:project_akhir/config/asset.dart';

void main() {
  runApp(DigitalArtApp());
}

class DigitalArtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booth App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;

                if (email == 'user@example.com' && password == 'password123') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ArtCanvasScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid credentials')),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ArtCanvasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Art Canvas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Canvas Area',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.blueGrey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.brush, color: Colors.blue),
                  onPressed: () {
                    // Implement brush tool functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.color_lens, color: Colors.red),
                  onPressed: () {
                    // Implement color picker functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.layers, color: Colors.green),
                  onPressed: () {
                    // Implement layers functionality
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
