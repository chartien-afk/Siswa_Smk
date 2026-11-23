
import 'package:flutter/material.dart';
import '../widgets/ui_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Selamat Datang 👋',
            style: TextStyle(
              fontSize: 13,
              color: muted,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Halo, Darel!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: ink,
            ),
          ),
          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFF47732),
                  Color(0xFFFFA15D),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RINGKASAN AKADEMIK',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    _Info(value: '14', label: 'Mapel'),
                    _Info(value: '04', label: 'Agenda'),
                    _Info(value: '90', label: 'Nilai'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),
          const SectionTitle('Informasi Presensi'),

          const SurfaceCard(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFE7F7EF),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Presensi Sekolah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Periksa kehadiran hari ini',
                        style: TextStyle(
                          color: muted,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),
          const SectionTitle('Jadwal Pelajaran'),

          const _Schedule(
            subject: 'Bahasa Indonesia',
            time: '07.00 - 08.30',
            room: 'XII RPL 1',
          ),
          const SizedBox(height: 10),
          const _Schedule(
            subject: 'Matematika',
            time: '08.30 - 10.00',
            room: 'XII RPL 1',
          ),
          const SizedBox(height: 10),
          const _Schedule(
            subject: 'Pemrograman Web',
            time: '10.15 - 11.45',
            room: 'Laboratorium',
          ),
        ],
      ),
    );
  }
}

class _Info extends StatelessWidget {
  final String value;
  final String label;

  const _Info({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _Schedule extends StatelessWidget {
  final String subject;
  final String time;
  final String room;

  const _Schedule({
    required this.subject,
    required this.time,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month,
            color: accent,
            size: 28,
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ink,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$time • $room',
                  style: const TextStyle(
                    color: muted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}