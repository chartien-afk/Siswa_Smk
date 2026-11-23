
import 'package:flutter/material.dart';
import '../widgets/ui_components.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  final List<Map<String, dynamic>> subjects = const [
    {
      'name': 'Bahasa Indonesia',
      'teacher': 'Bu Rina',
      'progress': 0.82,
      'icon': Icons.translate,
    },
    {
      'name': 'Bahasa Inggris',
      'teacher': 'Mr. David',
      'progress': 0.65,
      'icon': Icons.language,
    },
    {
      'name': 'Matematika',
      'teacher': 'Pak Arif',
      'progress': 0.40,
      'icon': Icons.calculate,
    },
    {
      'name': 'Pemrograman Web',
      'teacher': 'Pak Bima',
      'progress': 0.25,
      'icon': Icons.code,
    },
    {
      'name': 'Basis Data',
      'teacher': 'Bu Sari',
      'progress': 0.10,
      'icon': Icons.storage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeading(
            title: 'Ruang Belajar',
            subtitle: 'Materi pembelajaran siswa.',
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari mata pelajaran...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: subjects.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final subject = subjects[index];

                return SurfaceCard(
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFEEE4),
                          borderRadius:
                              BorderRadius.circular(13),
                        ),
                        child: Icon(
                          subject['icon'],
                          color: accent,
                        ),
                      ),

                      const SizedBox(width: 13),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              subject['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ink,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              subject['teacher'],
                              style: const TextStyle(
                                color: muted,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 10),
                            LinearProgressIndicator(
                              value: subject['progress'],
                              color: accent,
                              backgroundColor:
                                  const Color(0xFFF0F1F3)
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}