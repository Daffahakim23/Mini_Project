import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_project/Interface/intrerface.dart';
import 'package:mini_project/common/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkUserLogin() async {
    Timer(
      const Duration(seconds: 3),
      () async {
        String cekDataLogin = await getToken();

        if (cekDataLogin.isNotEmpty) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPageScreenWithProvider(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://i.pinimg.com/564x/b7/01/b4/b701b44dcdaaa77ded08cbac502771e9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Planet Watch',
            style: TextCustome().title,
          ),
        ),
      ),
    );
  }
}
