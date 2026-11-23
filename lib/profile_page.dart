
import 'package:flutter/material.dart';
import '../widgets/ui_components.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const PageHeading(
            title: 'Profil Saya',
            subtitle: 'Informasi akun siswa',
          ),
          const SurfaceCard(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFFFFE9DC),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: accent,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Darel Prijaya Putra Yulian',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 7),
                Text('XII RPL 1 • NIS 102938'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SectionTitle('Pengaturan'),
          const SurfaceCard(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.badge, color: accent),
                  title: Text('Data Diri'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: accent),
                  title: Text('Ubah Password'),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: accent),
                  title: Text('Notifikasi'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}