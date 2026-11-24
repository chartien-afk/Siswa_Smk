import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nis = TextEditingController(text: '9222');
  final password = TextEditingController();
  bool hide = true;

  @override
  void dispose() {
    nis.dispose();
    password.dispose();
    super.dispose();
  }

  void masuk() {
    if (nis.text.trim().isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Isi NIS dan password terlebih dahulu')),
      );
      return;
    }
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 35),
              const Text('SISTER\nSKANSIKA', style: TextStyle(
                fontSize: 34, height: 1.05, fontWeight: FontWeight.w800)),
              Container(width: 48, height: 4, color: const Color(0xFFF97316),
                margin: const EdgeInsets.only(top: 16, bottom: 12)),
              Text('Sistem Informasi Sekolah Terintegrasi',
                style: TextStyle(color: Theme.of(context).hintColor)),
              Text('SMK Negeri 1 Bukateja',
                style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
              const SizedBox(height: 46),
              const _FieldTitle('NIS / USERNAME'),
              TextField(controller: nis, keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Masukkan NIS')),
              const SizedBox(height: 30),
              const _FieldTitle('PASSWORD'),
              TextField(controller: password, obscureText: hide,
                decoration: InputDecoration(
                  hintText: 'Masukkan password',
                  suffixIcon: TextButton(
                    onPressed: () => setState(() => hide = !hide),
                    child: Text(hide ? 'Lihat' : 'Sembunyikan')),
                ),
                onSubmitted: (_) => masuk()),
              const SizedBox(height: 34),
              SizedBox(width: double.infinity, height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF111827),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  onPressed: masuk, child: const Text('Masuk')),
              ),
              const SizedBox(height: 18),
              Center(child: TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hubungi wali kelas untuk bantuan akun.'))),
                child: const Text('Lupa password? Hubungi wali kelas'))),
            ]),
          ),
        ),
      ),
    );
  }
}

class _FieldTitle extends StatelessWidget {
  final String text;
  const _FieldTitle(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
    style: TextStyle(fontSize: 10, letterSpacing: 1,
      fontWeight: FontWeight.bold, color: Theme.of(context).hintColor));
}
