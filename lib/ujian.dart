import 'package:flutter/material.dart';

class UjianPage extends StatelessWidget {
  const UjianPage({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(Icons.assignment_outlined, size: 64, color: Colors.grey),
      const SizedBox(height: 20),
      const Text('Belum ada ujian aktif', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      Text('Jadwal dan token ujian muncul di sini',
        style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
    ]),
  ));
}
