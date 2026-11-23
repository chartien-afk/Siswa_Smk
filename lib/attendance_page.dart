
import 'package:flutter/material.dart';
import '../widgets/ui_components.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() =>
      _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool hadir = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const PageHeading(
            title: 'Presensi Siswa',
            subtitle: 'Catat kehadiran sekolah',
          ),
          SurfaceCard(
            child: Column(
              children: [
                const Icon(
                  Icons.fact_check,
                  size: 60,
                  color: accent,
                ),
                const SizedBox(height: 15),
                Text(
                  hadir ? 'Presensi Berhasil' : 'Belum Presensi',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: hadir
                        ? null
                        : () {
                            setState(() {
                              hadir = true;
                            });
                          },
                    child: Text(
                      hadir ? 'Sudah Hadir' : 'Presensi Sekarang',
                    ),
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