import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:secure_text/pages/selectFile.dart';

void main() {
  runApp(secure_text());
}

class secure_text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => selectFile()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/image/logo.png',
              //height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            if (defaultTargetPlatform == TargetPlatform.android)
              const CupertinoActivityIndicator(
                color: Colors.black,
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.black,
              )
          ],
        ),
      ),
    );
  }
}
