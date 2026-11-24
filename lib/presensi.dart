import 'package:flutter/material.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});
  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  int step = 0;
  bool verifying = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Presensi Masuk')),
    body: Padding(padding: const EdgeInsets.all(24), child: Column(children: [
      const SizedBox(height: 30),
      Container(width: 240, height: 300,
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFF97316), width: 3)),
        child: const Center(child: Icon(Icons.face, size: 92, color: Colors.grey))),
      const SizedBox(height: 12),
      Text('Posisikan wajah di dalam bingkai',
        style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
      const SizedBox(height: 24),
      _step('01', 'Hadap lurus ke kamera', step >= 0),
      _step('02', 'Kedipkan mata', step >= 1),
      _step('03', 'Verifikasi wajah', step >= 2),
      const Spacer(),
      SizedBox(width: double.infinity, height: 50, child: FilledButton(
        onPressed: verifying ? null : () {
          setState(() { verifying = true; });
          Future.delayed(const Duration(milliseconds: 700), () {
            if (!mounted) return;
            Navigator.pop(context, 'masuk');
          });
        },
        child: Text(verifying ? 'Memverifikasi…' : 'Mulai verifikasi'))),
    ])),
  );

  Widget _step(String n, String label, bool active) => ListTile(
    contentPadding: EdgeInsets.zero, dense: true,
    leading: Text(n, style: const TextStyle(color: Color(0xFFF97316), fontWeight: FontWeight.bold)),
    title: Text(label, style: TextStyle(color: active ? null : Theme.of(context).hintColor)),
  );
}
