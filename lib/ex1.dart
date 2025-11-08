import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobbies'),
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[500],
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HobbyCard(
                icon: Icons.travel_explore,
                color: Colors.green,
                title: 'Travelling',
              ),
              SizedBox(height: 20),
              HobbyCard(icon: Icons.skateboarding, title: 'Skating'),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const HobbyCard({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(icon, color: Colors.white, size: 40),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
