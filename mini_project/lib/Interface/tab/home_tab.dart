import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../intrerface.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key, required String title});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PlanetWatch',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 30,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 0.5),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
              Shadow(
                offset: Offset(-2, -0.5),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // Hapus data login dari AuthProvider
        //       Provider.of<AuthProvider>(context, listen: false).logout();
        //       // Pindah ke halaman login
        //       Navigator.pushReplacementNamed(context, '/login');
        //     },
        //     icon: const Icon(
        //       Icons.movie,
        //     ),
        //   ),
        // ],
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/b7/01/b4/b701b44dcdaaa77ded08cbac502771e9.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const WatchBrandSlide(),
              Container(
                height: 5,
                color: const Color.fromARGB(251, 0, 0, 0),
              ),
              const BrandSlide(),
              Container(
                height: 5,
                color: const Color.fromARGB(251, 0, 0, 0),
              ),
              const WatchCatalogSection1(),
              // const BottomNavBar()
            ],
          ),
        ),
      ),
    );
  }
}
