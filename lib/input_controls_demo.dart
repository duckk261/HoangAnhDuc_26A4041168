import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderValue = 50;
  bool _isActive = false;
  String _selectedGenre = 'Action';
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Exercise 2 – Input Controls Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating (Slider)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Current value: ${_sliderValue.round()}'),
            const SizedBox(height: 4),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() { _sliderValue = value; });
              },
            ),
            const SizedBox(height: 24),
            const Text('Active (Switch)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Is movie active?'),
                Switch(
                  value: _isActive,
                  onChanged: (bool value) {
                    setState(() { _isActive = value; });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Genre (RadioListTile)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() { _selectedGenre = value!; });
              },
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (String? value) {
                setState(() { _selectedGenre = value!; });
              },
            ),
            const SizedBox(height: 4),
            Text('Selected genre: $_selectedGenre'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Open Date Picker'),
            ),
            const SizedBox(height: 12),
            Text(
              _selectedDate != null
                  ? 'Selected date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                  : 'No date selected.',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
