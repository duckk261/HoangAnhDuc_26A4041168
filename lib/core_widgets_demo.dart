import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Exercise 1 – Core Widgets Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Icon(Icons.movie, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/I-80_Eastshore_Freeway.jpg/1280px-I-80_Eastshore_Freeway.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 64, color: Colors.grey)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text('Movie Item'),
                subtitle: const Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
