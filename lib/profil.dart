import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPinkTheme = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isPinkTheme
        ? const Color.fromARGB(255, 252, 8, 191) : const Color.fromARGB(255, 9, 177, 255);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            color: const Color.fromARGB(255, 0, 22, 121),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 🔹 User icon dan email (username) di kiri atas
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.account_circle, size: 40, color: Colors.white),
                    const SizedBox(height: 4),
                    Text(
                      widget.email,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                // 🔹 Theme switcher di kanan atas
                IconButton(
                  icon: const Icon(Icons.color_lens, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      isPinkTheme = !isPinkTheme;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              "Selamat datang, ${widget.email}!",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              "Home",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
