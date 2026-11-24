import 'package:flutter/material.dart';
import 'belajar.dart';
import 'presensi.dart';
import 'ujian.dart';
import 'profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  DateTime now = DateTime.now();
  String? masukAt, pulangAt;

  final pages = const [BerandaTab(), BelajarPage(), UjianPage(), ProfilPage()];

  void bukaPresensi() async {
    final result = await Navigator.push<String>(context,
      MaterialPageRoute(builder: (_) => const PresensiPage()));
    if (result == 'masuk') setState(() => masukAt = _jam());
    if (result == 'pulang') setState(() => pulangAt = _jam());
  }

  String _jam() {
    final d = DateTime.now();
    return '${d.hour.toString().padLeft(2,'0')}:${d.minute.toString().padLeft(2,'0')}';
  }

  @override
  Widget build(BuildContext context) {
    final titles = ['Beranda', 'Belajar', 'Ujian', 'Profil'];
    return Scaffold(
      appBar: selected == 0 ? null : AppBar(title: Text(titles[selected])),
      body: selected == 0 ? _beranda() : pages[selected],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected < 2 ? selected : selected + 1,
        onDestinationSelected: (i) {
          if (i == 2) { bukaPresensi(); return; }
          setState(() => selected = i < 2 ? i : i - 1);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.school_outlined), label: 'Belajar'),
          NavigationDestination(icon: Icon(Icons.face_retouching_natural_outlined), label: 'Presensi'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), label: 'Ujian'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _beranda() {
    const jadwal = {
      'Sen': [['07.00','Mapel Konsentrasi RPL'],['09.30','Matematika'],['12.30','Bahasa Indonesia']],
      'Sel': [['07.00','Bahasa Inggris'],['09.30','Sejarah'],['12.30','PJOK']],
      'Rab': [['07.00','Mapel Konsentrasi RPL'],['10.00','Pendidikan Pancasila']],
      'Kam': [['07.00','Matematika'],['09.30','Bahasa Jawa']],
      'Jum': [['07.00','Pendidikan Agama Islam'],['09.30','Kreativitas, Inovasi, Kewirausahaan']],
    };
    final keys = jadwal.keys.toList();
    final dayIndex = (now.weekday - 1).clamp(0, 4);
    return ListView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 24), children: [
      Text('${_hari(now.weekday)}, ${now.day} ${_bulan(now.month)} ${now.year}',
        style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
      const SizedBox(height: 6),
      const Text('Halo, Chartien', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
      Text('XI RPL 1 · NIS 9222', style: TextStyle(color: Theme.of(context).hintColor)),
      const _SectionTitle('PRESENSI HARI INI'),
      _attendanceRow('Masuk', masukAt),
      _attendanceRow('Pulang', pulangAt),
      const SizedBox(height: 20),
      SizedBox(height: 52, child: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: const Color(0xFF111827), foregroundColor: Colors.white),
        onPressed: bukaPresensi,
        child: Text(pulangAt != null ? 'Presensi lengkap ✓' : 'Presensi Wajah'))),
      const _SectionTitle('JADWAL (CONTOH DATA)'),
      ...jadwal[keys[dayIndex]]!.map((e) => ListTile(
        contentPadding: EdgeInsets.zero, dense: true,
        leading: Text(e[0], style: const TextStyle(color: Color(0xFFF97316), fontWeight: FontWeight.bold)),
        title: Text(e[1]))),
      const _SectionTitle('PINTASAN'),
      ListTile(contentPadding: EdgeInsets.zero, title: const Text('Pengajuan izin'),
        trailing: const Icon(Icons.chevron_right), onTap: () => _info('Fitur izin segera hadir')),
      ListTile(contentPadding: EdgeInsets.zero, title: const Text('Jurnal PKL'),
        trailing: const Icon(Icons.chevron_right), onTap: () => _info('Periode PKL belum dimulai')),
      const ListTile(contentPadding: EdgeInsets.zero, title: Text('Poin pelanggaran'),
        trailing: Text('0 poin')),
    ]);
  }

  Widget _attendanceRow(String label, String? time) => Row(children: [
    Expanded(child: Text(label, style: const TextStyle(fontSize: 15))),
    Text(time ?? '--:--', style: TextStyle(color: Theme.of(context).hintColor)),
    const SizedBox(width: 18),
    Text(time == null ? 'Belum' : 'Sudah',
      style: TextStyle(color: time == null ? const Color(0xFFF97316) : Colors.green,
        fontWeight: FontWeight.bold)),
  ]);

  void _info(String s) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  String _hari(int n) => ['Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu'][n-1];
  String _bulan(int n) => ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'][n-1];
}

class BerandaTab extends StatelessWidget {
  const BerandaTab({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 30, bottom: 8),
    child: Text(text, style: TextStyle(fontSize: 10, letterSpacing: 1,
      fontWeight: FontWeight.bold, color: Theme.of(context).hintColor)));
}
