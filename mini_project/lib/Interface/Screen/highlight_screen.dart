import 'package:flutter/material.dart';
import '../../Common/common.dart';
import '../intrerface.dart';

class WatchCatalogSection1 extends StatefulWidget {
  const WatchCatalogSection1({super.key});

  @override
  State<WatchCatalogSection1> createState() => _WatchCatalogSection1State();
}

class _WatchCatalogSection1State extends State<WatchCatalogSection1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text("Recommended", style: TextCustome().title),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                height: 320,
                width: double.infinity,
                child: FutureBuilder(
                  future: WatchService().getListWatch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      // return GridView.builder with data
                      return GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var watch = data?.products[index];
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: 420,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // const SizedBox(
                                          //   height: 5,
                                          // ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              watch?.image ?? "-",
                                              width: 300,
                                              height: 300,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 55, left: 55),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            Detail_Screen(
                                                          watchId: watch?.id
                                                                  .toString() ??
                                                              "",
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          fixedSize: const Size(
                                                              120, 45)),
                                                  child: const Text(
                                                    'Open',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          fixedSize: const Size(
                                                              120, 45)),
                                                  child: const Text(
                                                    'Close',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 250,
                              child: Card(
                                color: Colors.transparent.withOpacity(0.3),
                                child: Column(
                                  children: [
                                    const MySizeBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        height: 90,
                                        child: Image.network(
                                          watch?.image ?? "-",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    const MySizeBox(height: 10.0),
                                    Text(
                                      watch?.productName ?? "-",
                                      textAlign: TextAlign.center,
                                      style: TextCustome().small,
                                    ),
                                    Text(
                                      watch?.idNprice ?? "-",
                                      style: TextCustome().price,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    // return loading indicator
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
