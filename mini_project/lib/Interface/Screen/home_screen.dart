import 'package:flutter/material.dart';
import 'package:mini_project/Interface/tab/wishlist_tab.dart';
import '../../Common/common.dart';
import '../intrerface.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
    String _username = "";
  void initial() async {
    _username = await getToken();
    setState(() {});
  }

  @override
  void initState() {
    initial();

    // ContactService().getContact();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const HomeTab(
        title: '',
      ),
      const CatalogTab(),
      const WatchListScreen()
    ];
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: currentIndex,
          children: children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: ColorConstant.primary,
        unselectedItemColor: ColorConstant.grey,
        backgroundColor: Colors.black,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.icHome,
              width: 20,
              color: currentIndex == 0
                  ? ColorConstant.primary
                  : ColorConstant.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.icCatalog,
              width: 20,
              color: currentIndex == 1
                  ? ColorConstant.primary
                  : ColorConstant.grey,
            ),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetPath.icOrder,
              width: 20,
              color: currentIndex == 2
                  ? ColorConstant.primary
                  : ColorConstant.grey,
            ),
            label: 'WatchList',
          ),
        ],
      ),
    );
  }
}
