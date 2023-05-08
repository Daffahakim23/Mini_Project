import 'package:flutter/material.dart';
import '../../Common/common.dart';
import '../intrerface.dart';


class BrandSlide extends StatelessWidget {
  const BrandSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
      height: 90,
      width: double.infinity,
      color: const Color.fromARGB(0, 0, 0, 0),
      child: FutureBuilder(
        future: WatchService().getListWatch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: data?.brands.length,
              itemBuilder: (context, index) {
                var watch = data?.brands[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const CatalogTab();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final tween = Tween(begin: 0.0, end: 1.0);
                          return FadeTransition(
                            opacity: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 150,
                    width: 80,
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          watch?.brandLogo ?? "-",
                          fit: BoxFit.cover,
                          height: 110,
                          width: 100,
                        ),
                      ),
                      
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
