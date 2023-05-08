import 'package:flutter/material.dart';
import 'package:mini_project/Common/common.dart';
import 'package:mini_project/Interface/tab/wishlist_tab.dart';
import '../intrerface.dart';

class CatalogTab extends StatefulWidget {
  const CatalogTab({super.key});

  @override
  State<CatalogTab> createState() => _CatalogTabState();
}

class _CatalogTabState extends State<CatalogTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/b7/01/b4/b701b44dcdaaa77ded08cbac502771e9.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            height: 760,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Container(
                  color: Colors.transparent.withOpacity(0.5),
                  padding: const EdgeInsets.only(right: 50, left: 50),
                  child: SizedBox(
                    height: 750,
                    width: double.infinity,
                    child: FutureBuilder(
                      future: WatchService().getListWatch(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: data?.products.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var watch = data?.products[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Detail_Screen(
                                        watchId: watch?.id.toString() ?? "",
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 367,
                                  child: Card(
                                    color: Colors.transparent.withOpacity(0.5),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 240,
                                            width: 380,
                                            child: Image.network(
                                              watch?.image ?? "-",
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          Text(watch?.productName ?? "-",
                                              style: TextCustome().title),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

                                  // showModalBottomSheet(
                                  //   context: context,
                                  //   shape: const RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.vertical(
                                  //       top: Radius.circular(20),
                                  //     ),
                                  //   ),
                                  //   backgroundColor:
                                  //       Colors.transparent.withOpacity(0.9),
                                  //   builder: (BuildContext context) {
                                  //     return Padding(
                                  //       padding: const EdgeInsets.all(10),
                                  //       child: SizedBox(
                                  //         height: 455,
                                  //         child: Column(
                                  //           children: [
                                  //             const SizedBox(
                                  //               height: 20,
                                  //             ),
                                  //             ClipRRect(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(10),
                                  //               child: Image.network(
                                  //                 watch?.image ?? "-",
                                  //                 width: 350,
                                  //                 height: 350,
                                  //                 fit: BoxFit.cover,
                                  //               ),
                                  //             ),
                                  //             const SizedBox(
                                  //               height: 16,
                                  //             ),
                                  //             Padding(
                                  //               padding: const EdgeInsets.only(
                                  //                   right: 55, left: 55),
                                  //               child: Row(
                                  //                 mainAxisAlignment:
                                  //                     MainAxisAlignment
                                  //                         .spaceBetween,
                                  //                 children: [
                                  //                   ElevatedButton(
                                  //                     onPressed: () {
                                  //                       Navigator.push(
                                  //                           context,
                                  //                           MaterialPageRoute(
                                  //                             builder: (context) =>
                                  //                                 Detail_Screen(
                                  //                               watchId: watch
                                  //                                       ?.id
                                  //                                       .toString() ??
                                  //                                   "",
                                  //                               title: '',
                                  //                             ),
                                  //                           ));
                                  //                     },
                                  //                     style: ElevatedButton
                                  //                         .styleFrom(
                                  //                             fixedSize:
                                  //                                 const Size(
                                  //                                     120, 45)),
                                  //                     child: const Text(
                                  //                       'Open',
                                  //                       style: TextStyle(
                                  //                           fontSize: 18),
                                  //                     ),
                                  //                   ),
                                  //                   ElevatedButton(
                                  //                     onPressed: () {
                                  //                       Navigator.pop(context);
                                  //                     },
                                  //                     style: ElevatedButton
                                  //                         .styleFrom(
                                  //                             fixedSize:
                                  //                                 const Size(
                                  //                                     120, 45)),
                                  //                     child: const Text(
                                  //                       'Close',
                                  //                       style: TextStyle(
                                  //                           fontSize: 18),
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     );
                                  //   },
                                  // );