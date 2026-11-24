import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 24), children: [
    const Text('Profil', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
    const SizedBox(height: 22),
    const Text('Chartien Anggara Ninda Gunawan', style: TextStyle(fontWeight: FontWeight.bold)),
    Text('XI RPL 1 · NIS 9222 · SMK N 1 Bukateja',
      style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
    const SizedBox(height: 22),
    const Row(children: [
      _Stat('0','Hadir'), _Stat('0','Sakit'), _Stat('0','Izin'), _Stat('0','Alpha')]),
    const Divider(height: 24),
    const ListTile(contentPadding: EdgeInsets.zero, title: Text('Poin pelanggaran'), trailing: Text('0 poin')),
    ListTile(contentPadding: EdgeInsets.zero, title: const Text('Data diri'),
      trailing: const Icon(Icons.chevron_right), onTap: () => showDialog(context: context,
        builder: (_) => AlertDialog(title: const Text('Data diri'), content: const Text(
          'Nama: Chartien Anggara Ninda Gunawan\\nNIS: 9222\\nKelas: XI RPL 1\\nSekolah: SMK N 1 Bukateja\\nTahun ajaran: 2026/2027')))),
    const ListTile(contentPadding: EdgeInsets.zero, title: Text('Registrasi wajah'), trailing: Icon(Icons.chevron_right)),
    const ListTile(contentPadding: EdgeInsets.zero, title: Text('Reset wajah'), trailing: Icon(Icons.chevron_right)),
    ValueListenableBuilder<ThemeMode>(valueListenable: appTheme, builder: (_, mode, __) =>
      SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Mode gelap'),
        value: mode == ThemeMode.dark,
        onChanged: (v) => appTheme.value = v ? ThemeMode.dark : ThemeMode.light)),
    ListTile(contentPadding: EdgeInsets.zero, title: const Text('Log Out',
      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      onTap: () => Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const LoginPage()), (_) => false)),
  ]);
}

class _Stat extends StatelessWidget {
  final String value, label;
  const _Stat(this.value, this.label);
  @override
  Widget build(BuildContext context) => Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
    Text(label, style: TextStyle(fontSize: 11, color: Theme.of(context).hintColor)),
  ]));
}
