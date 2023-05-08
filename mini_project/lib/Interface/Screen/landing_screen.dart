import 'package:flutter/material.dart';

class WatchBrandSlide extends StatefulWidget {
  const WatchBrandSlide({super.key});

  @override
  State<WatchBrandSlide> createState() => _WatchBrandSlideState();
}

class _WatchBrandSlideState extends State<WatchBrandSlide> {
  final ScrollController _scrollController = ScrollController();

  final List<String> imagePaths = const [
    'assets/landing7.jpg',
    'assets/landing1.jpg',
    'assets/catalog2.jpg',
    'assets/landing2.jpg',
    'assets/landing3.jpg',
    'assets/landing4.jpg',
    'assets/landing5.jpg',
    'assets/landing6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 300,
      width: double.infinity,
      color: const Color(0xFF1d1d1d),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          MainAxisAlignment.center;
          return GestureDetector(
            // onTap: () {
            //   Navigator.of(context).push(
            //     PageRouteBuilder(
            //       pageBuilder: (context, animation, secondaryAnimation) {
            //         return const Detail_Screen(
            //           watchId: '',
            //         );
            //       },
            //       transitionsBuilder:
            //           (context, animation, secondaryAnimation, child) {
            //         final tween = Tween(begin: 0.0, end: 1.0);
            //         return FadeTransition(
            //           opacity: animation.drive(tween),
            //           child: child,
            //         );
            //       },
            //     ),
            //   );
            // },
            child: SizedBox(
              width: 450,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 0, 0),
                  borderRadius: BorderRadius.circular(0),
                  // border: Border.all(color: const Color(0xFFcaa969), width: 2),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: const Color.fromARGB(255, 100, 99, 99)
                  //         .withOpacity(0.2),
                  //     spreadRadius: 3,
                  //     blurRadius: 5,
                  //     offset: const Offset(0, 2),
                  //   ),
                  // ],
                ),
                // margin: const EdgeInsets.only(
                //     top: 10, bottom: 10, left: 10, right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    imagePaths[index],
                    width: 350,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
