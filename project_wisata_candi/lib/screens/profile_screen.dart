//Template default Stateful Widget

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

// class dan implementasi State (Kode Logika)
class _ProfileScreenState extends State<ProfileScreen> {
  // Variable yang dibutuhkan
  bool isSignedIn = false;
  String username = "JordiW";
  String fullname = "Jordi";
  int favoriteCandiCount = 0;

  // Implementasi fungsi Sign in
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  // Implementasi fungsi Sign out
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Bagian Profile Header
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("images/placeholder_image.png"),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt,
                                  color: Colors.deepPurple[50])),
                      ],
                    ),
                  ),
                ),
                // Bagian profile info
                // Baris 1 Profile Info Pengguna
                const SizedBox(height: 4),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Pengguna",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ": $username",
                      style: TextStyle(fontSize: 18),
                    ))
                  ],
                ),

                // Baris 2 Profile Info Nama
                const SizedBox(height: 4),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Nama",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ": $fullname",
                      style: TextStyle(fontSize: 18),
                    )),
                    if (isSignedIn) const Icon(Icons.edit),
                  ],
                ),
                // Baris 3 Favorite
                const SizedBox(height: 4),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Favorite",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ": $favoriteCandiCount",
                      style: TextStyle(fontSize: 18),
                    ))
                  ],
                ),

                // Bagian profile Action
                const SizedBox(height: 4),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                const SizedBox(
                  height: 20,
                ),

                // Cara tulis if else dengan ternary operator
                // sign in / sign out button
                isSignedIn
                    ? TextButton(
                        onPressed: signOut, child: const Text("Sign Out"))
                    : TextButton(
                        onPressed: signIn, child: const Text("Sign In"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
