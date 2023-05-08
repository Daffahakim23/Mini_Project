import 'package:flutter/material.dart';
import 'package:mini_project/Common/model/productList_response.dart';
import '../../Common/common.dart';
import 'package:mini_project/Common/service/product_service.dart';
import '../../Common/db/database_helper.dart';
import '../intrerface.dart';

// ignore: camel_case_types
class Detail_Screen extends StatefulWidget {
  final String watchId;
  const Detail_Screen({super.key, required this.watchId});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  bool _isInsert = false;

  WatchlistTable? _watchlistMovieTable = WatchlistTable(
    id: -1,
    productName: "",
    image: "",
  );

  void getWatchlistStatus() async {
    _watchlistMovieTable = await DatabaseHelper().getStatusWatchlist(
      int.parse(
        widget.watchId,
      ),
    );
    if (_watchlistMovieTable != null) {
      _isInsert = true;
    }
  }

  @override
  void initState() {
    getWatchlistStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Watch'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/b7/01/b4/b701b44dcdaaa77ded08cbac502771e9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: WatchService().getDetailWatch(widget.watchId),
          builder: (context, snapshot) {
            // print(snapshot.data?.id);
            if (snapshot.hasData) {
              final detailWatch = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 360,
                      child: Card(
                        margin: const EdgeInsets.only(
                            right: 40, left: 40, bottom: 10),
                        color: Colors.transparent.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Image.network(
                                  detailWatch?.image ?? "-",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Text(detailWatch?.productName ?? "-",
                                  style: TextCustome().title),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              if (_isInsert == true) {
                                _isInsert = false;
                                DatabaseHelper().removeWatchlist(
                                  detailWatch?.id ?? -1,
                                );
                              } else {
                                _isInsert = true;
                                DatabaseHelper().insertWatchlist(
                                  WatchlistTable(
                                    id: detailWatch?.id ?? -1,
                                    productName: detailWatch?.productName ?? "",
                                    image: detailWatch?.image ?? "",
                                  ),
                                );
                              }
                              setState(() {});
                            },
                            icon: _isInsert == true
                                ? const Icon(Icons.delete)
                                : const Icon(
                                    Icons.add,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description", style: TextCustome().subtitle),
                          Text(detailWatch?.description ?? "",
                              style: TextCustome().small),
                          const MySizeBox(height: 10.0),
                          Text("Price", style: TextCustome().subtitle),
                          Text(detailWatch?.idNprice ?? "",
                              style: TextCustome().small),
                          const MySizeBox(height: 10.0),
                          Text("Material", style: TextCustome().subtitle),
                          Text(detailWatch?.material ?? "",
                              style: TextCustome().small),
                          const MySizeBox(height: 10.0),
                          Text("Water Resistance",
                              style: TextCustome().subtitle),
                          Text(detailWatch?.waterResistance ?? "",
                              style: TextCustome().small),
                          const MySizeBox(height: 10.0),
                          Text("Diameter", style: TextCustome().subtitle),
                          Text(detailWatch?.diameter ?? "",
                              style: TextCustome().small),
                          const MySizeBox(height: 10.0),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
