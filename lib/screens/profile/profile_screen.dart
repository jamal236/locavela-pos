import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String nama = "Guest";
  String email = "-";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      nama = prefs.getString("nama") ?? "Guest";
      email = prefs.getString("email") ?? "-";
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1EB),

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.brown,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.brown,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              email,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Kasir • Locavela Coffee",
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Nama"),
                    subtitle: Text(nama),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("Email"),
                    subtitle: Text(email),
                  ),

                  const Divider(height: 1),

                  const ListTile(
                    leading: Icon(Icons.store),
                    title: Text("Outlet"),
                    subtitle: Text("Locavela Coffee"),
                  ),

                  const Divider(height: 1),

                  const ListTile(
                    leading: Icon(Icons.badge),
                    title: Text("Role"),
                    subtitle: Text("Kasir"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text(
                        "Yakin ingin keluar dari aplikasi?"
                      ),
                      actions: [

                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Batal"),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: logout,
                          child: const Text("Logout"),
                        )

                      ],
                    ),
                  );

                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}