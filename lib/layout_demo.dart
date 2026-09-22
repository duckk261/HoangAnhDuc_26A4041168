import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movieTitles = [
      'Avatar',
      'Inception',
      'Interstellar',
      'Joker',
      'The Dark Knight',
      'Titanic',
      'Parasite',
      'Gladiator',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Exercise 3 – Layout Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: movieTitles.length,
                itemBuilder: (context, index) {
                  final String movieName = movieTitles[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade200,
                        child: Text(
                          movieName[0],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(movieName),
                      subtitle: const Text('Sample description'),
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
