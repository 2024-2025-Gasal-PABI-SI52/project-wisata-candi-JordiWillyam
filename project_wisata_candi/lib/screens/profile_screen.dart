//Template default Stateful Widget

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Variable yang dibutuhkan
    bool isSignIn = true;
    String fullname = "";
    String email = "";
    int favoriteCandiCount = 0;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
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
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage("images/placeholder_image.png"),
                          ),
                    ),
                    if (isSignIn) IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50])),
                    ],
                    ),
                  ),
                ),
                // Bagian profile info
            
                // Bagian profile Action
            
              ],
            ),
          )
        ],
      ),
    );
  }
}
// Template defaultnya samapai di sini

