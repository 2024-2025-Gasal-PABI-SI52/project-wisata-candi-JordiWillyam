import 'package:flutter/material.dart';
import 'package:project_wisata_candi/data/candi_data.dart';
import 'package:project_wisata_candi/models/candi.dart';
import 'package:project_wisata_candi/screens/detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Candi> _favoriteCandi = [];

  Future<void> _getFavoriteList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteCandiNames =
        prefs.getStringList("favoriteCandi") ?? [];
    // get favorite list from shared preferences

    setState(() {
      _favoriteCandi = candiList
          .where((candi) => favoriteCandiNames.contains(candi.name))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              padding: const EdgeInsets.all(8),
              //ganti jadi _favoriteCandi
              itemCount: _favoriteCandi.length,
              //item builder
              itemBuilder: (context, index) {
                Candi varCandi = _favoriteCandi[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(varCandi: varCandi)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.all(6),
                    elevation: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // Gambar
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              varCandi.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Nama Candi
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            varCandi.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Lokasi Candi
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8),
                          child: Text(
                            varCandi.location,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
