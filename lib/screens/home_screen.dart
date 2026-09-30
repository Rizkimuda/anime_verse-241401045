import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/genre_list.dart';
import '../widgets/anime_card.dart';
import 'favorite_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> dummyAnime = [
    {
      'title': 'Sousou no Frieren',
      'rating': 9.3,
      'episodes': 28,
      'image': 'assets/images/souso_no_frieren.jpg',
      'synopsis': 'Kisah petualangan penyihir Frieren setelah kelompok pahlawan berhasil mengalahkan Raja Iblis.'
    },
    {
      'title': 'Fullmetal Alchemist: Brotherhood',
      'rating': 9.1,
      'episodes': 64,
      'image': 'assets/images/fullmetal_alchemist_brotherhood.jpg',
      'synopsis': 'Dua bersaudara Elric mencari Batu Bertuah untuk mengembalikan tubuh mereka.'
    },
    {
      'title': 'Hunter x Hunter',
      'rating': 9.0,
      'episodes': 148,
      'image': 'assets/images/hunter_x_hunter.jpg',
      'synopsis': 'Gon Freecss bercita-cita menjadi Hunter hebat demi menemukan ayahnya.'
    },
    {
      'title': 'Koe no Katachi',
      'rating': 8.9,
      'episodes': 1,
      'image': 'assets/images/koe_no_katachi.jpg',
      'synopsis': 'Kisah penebusan dosa dan persahabatan antara Ishida dan Nishimiya.'
    },
    {
      'title': 'Black Clover',
      'rating': 8.2,
      'episodes': 170,
      'image': 'assets/images/black_clover.jpg',
      'synopsis': 'Asta yang lahir tanpa sihir berjuang menjadi Kaisar Sihir.'
    },
    {
      'title': 'Vinland Saga',
      'rating': 8.8,
      'episodes': 48,
      'image': 'assets/images/vinland_saga.jpg',
      'synopsis': 'Thorfinn menempuh jalan balas dendam di tengah perang kaum Viking.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeContent(),
      const FavoriteScreen(),
      const ProfileScreen(),
    ];

    return AppScaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF1E1B2E),
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Anime Verse',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const CustomSearchBar(),
          const SizedBox(height: 16),
          const GenreList(),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: dummyAnime.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return AnimeCard(anime: dummyAnime[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}