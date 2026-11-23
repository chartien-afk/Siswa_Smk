
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'learning_page.dart';
import 'exam_page.dart';
import 'attendance_page.dart';
import 'profile_page.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int selectedIndex = 0;

  final pages = const [
    HomePage(),
    LearningPage(),
    ExamPage(),
    AttendancePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Belajar',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            label: 'Ujian',
          ),
          NavigationDestination(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Presensi',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}