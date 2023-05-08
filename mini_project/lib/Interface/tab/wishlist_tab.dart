import 'package:flutter/material.dart';
import 'package:mini_project/Common/db/database_helper.dart';
import 'package:mini_project/Interface/intrerface.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Watch Wishlist',
          style: TextCustome().title,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/b7/01/b4/b701b44dcdaaa77ded08cbac502771e9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: DatabaseHelper().getListWatchlist(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return data?.isEmpty == true
                  ? const Center(child: Text('Kosong'))
                  : ListView.separated(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 120,
                                child: Card(
                                  color: Colors.transparent.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Image.network(
                                              data?[index].image ?? "-",
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            data?[index].productName ?? "",
                                            style: TextCustome().subtitle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                    );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
