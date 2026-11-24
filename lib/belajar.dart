import 'package:flutter/material.dart';

class BelajarPage extends StatefulWidget {
  const BelajarPage({super.key});
  @override
  State<BelajarPage> createState() => _BelajarPageState();
}

class _BelajarPageState extends State<BelajarPage> {
  String query = '';
  final subjects = const [
    ['BIND','Bahasa Indonesia','Nur Yuliandrianingtyas, S.Pd.'],
    ['BING','Bahasa Inggris','Yunita Kusuma Wardhani, S.Pd.'],
    ['BJ','Bahasa Jawa','Dyan Kartikawati, S.Pd.'],
    ['BK','Bimbingan Konseling','Abdi Sholih Pratama, S.Pd.'],
    ['JPN','Bahasa Jepang','Imam Maulana Burhannudien, S.Pd.'],
    ['KIK','Kreativitas, Inovasi, dan Kewirausahaan','Anjar Pamungkas, S.T.'],
    ['RPL','Mapel Konsentrasi RPL','Nur Eling Tyas, S.Pd.'],
    ['RPL','Mapel Konsentrasi RPL','Paras Taufani, S.Kom.'],
    ['MTK','Matematika','Dyah Ratna Purnandari, S.Pd.'],
    ['MTK','Matematika','Setya Rahayu, S.Pd.'],
    ['PAI','Pendidikan Agama Islam dan Budi Pekerti','Eko Saputro, S.Pd.I., M.Pd.'],
    ['PJOK','Pendidikan Jasmani, Olahraga dan Kesehatan','Syaiful Dwi Jatmiko, S.Pd.'],
    ['PP','Pendidikan Pancasila','Ismawati, S.Pd.'],
    ['SEJ','Sejarah','Kurnia Panggara Putri, S.Pd.'],
  ];
  @override
  Widget build(BuildContext context) {
    final list = subjects.where((s) => s.join(' ').toLowerCase().contains(query.toLowerCase())).toList();
    return ListView(padding: const EdgeInsets.fromLTRB(24, 28, 24, 20), children: [
      const Text('Belajar', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
      Text('14 mata pelajaran · 0 materi · 0 tugas aktif',
        style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
      TextField(onChanged: (v) => setState(() => query = v),
        decoration: const InputDecoration(hintText: 'Cari mata pelajaran…', prefixIcon: Icon(Icons.search))),
      const SizedBox(height: 10),
      ...list.map((s) => InkWell(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Belum ada materi untuk ${s[1]}'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(children: [
            Container(width: 44, height: 44, alignment: Alignment.center,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(7)),
              child: Text(s[0], style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 10, fontWeight: FontWeight.bold))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s[1], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              Text(s[2], style: TextStyle(fontSize: 10, color: Theme.of(context).hintColor)),
            ])),
            Text('0 / 0', style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
          ]),
        ),
      )),
    ]);
  }
}
