
import 'package:flutter/material.dart';
import '../widgets/ui_components.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const PageHeading(
            title: 'Ujian & CBT',
            subtitle: 'Informasi ujian siswa',
          ),
          const SurfaceCard(
            child: Column(
              children: [
                Icon(
                  Icons.assignment,
                  size: 50,
                  color: accent,
                ),
                SizedBox(height: 15),
                Text(
                  'Belum Ada Ujian Aktif',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Jadwal ujian akan muncul di sini.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}