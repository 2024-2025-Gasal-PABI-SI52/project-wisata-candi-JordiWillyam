import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Deklarasi variabel
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Sign In'),
      ),

      // Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
              // Atur mainAxisAlignment dan crossAxisAlignment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // buat TextFormField untuk nama pengguna
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Nama Pengguna",
                    hintText: "Masukkan nama pengguna Anda",
                    border: OutlineInputBorder(),
                  ),
                ),
                // buat TextFormField untuk kata sandi
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    hintText: "Masukkan kata sandi",
                    border: const OutlineInputBorder(),
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                // buat ElevatedButton untuk sign in
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                ),
                //Pasang textButton untuk sign up
                const SizedBox(
                  height: 10,
                ),
                //   TextButton(onPressed: () {},
                //   child: const Text('Belum punya akun? Daftar di sini.')
                // ),
                RichText(
                  text: TextSpan(
                    text: "Belum punya akun?",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                    children: [
                      TextSpan(
                        text: " Daftar di sini.",
                        style: const TextStyle(
                          color: Colors.blue, 
                          fontSize: 16,
                          decoration: TextDecoration.underline,),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {},
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
