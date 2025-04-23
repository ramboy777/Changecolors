import 'package:flutter/material.dart';
import 'profil.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => LoginscreenState();
}

class LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = true;

  void togglePasswordVisibility() {
    setState(() {
      tampilPassword = !tampilPassword;
    });
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    print("Email: $email, Password: $password");

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(email: email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan password wajib diisi")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Color.fromARGB(255, 67, 53, 255),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email Atau Username",
                    hintText: "Masukkan email atau username",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: tampilPassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Masukkan password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        tampilPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: login,
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
