import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:project_wisata_candi/data/user_data.dart';
import 'package:project_wisata_candi/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Deklarasi controller untuk email dan password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variabel untuk menyembunyikan/menampilkan password
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Aplikasi
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset("images/mangalogo.jpg"),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Input Email
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Input Your Email",
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Input Password
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Input Your Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),

                  const SizedBox(height: 20),

                  // Tombol Sign In
                  ElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                       User? signInUser = validateLogin(email, password);

                      if (signInUser != null) {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool("isSignIn", true);
                        await prefs.setString("email", signInUser.email);
                        await prefs.setString("name", signInUser.name); // Save the user's name
                        Navigator.pushReplacementNamed(context, "/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email atau Password salah"),
                          ),
                        );
                      }
                    },
                    child: const Text('Sign In'),
                  ),

                  const SizedBox(height: 10),

                  // Tautan untuk Sign Up
                  RichText(
                    text: TextSpan(
                      text: "Belum punya akun?",
                      style: const TextStyle(
                          color: Colors.deepPurple, fontSize: 16),
                      children: [
                        TextSpan(
                          text: " Daftar di sini.",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Tambahkan navigasi ke layar pendaftaran jika diperlukan
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk validasi login
  User? validateLogin(String email, String password) {
    for (User user in userList) {
      if (user.email == email && user.password == password) {
        return user; // Return the user if login is valid
      }
    }
    return null; // Return null if login is invalid
  }
}
