import 'package:flutter/material.dart';

import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_demo.dart';
import 'app_structure_demo.dart';
import 'common_ui_fixes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 – Flutter UI Fundamentals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Hoang Anh Duc – 26A4041168',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Chọn một bài tập để xem:',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          _buildExerciseCard(
            context,
            title: 'Exercise 1 – Core Widgets Demo',
            subtitle: 'Text, Image, Icon, Card, ListTile',
            icon: Icons.widgets,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CoreWidgetsDemo()));
            },
          ),
          _buildExerciseCard(
            context,
            title: 'Exercise 2 – Input Controls Demo',
            subtitle: 'Slider, Switch, RadioListTile, DatePicker',
            icon: Icons.input,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InputControlsDemo()));
            },
          ),
          _buildExerciseCard(
            context,
            title: 'Exercise 3 – Layout Demo',
            subtitle: 'Column, Row, Padding, ListView.builder',
            icon: Icons.dashboard,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LayoutDemo()));
            },
          ),
          _buildExerciseCard(
            context,
            title: 'Exercise 4 – App Structure & Theme',
            subtitle: 'Scaffold, AppBar, FAB, Dark Mode toggle',
            icon: Icons.color_lens,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AppStructureDemo()));
            },
          ),
          _buildExerciseCard(
            context,
            title: 'Exercise 5 – Common UI Fixes',
            subtitle: 'ListView fix, Overflow, setState, DatePicker',
            icon: Icons.build,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CommonUIFixes()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.indigo),
        onTap: onTap,
      ),
    );
  }
}
