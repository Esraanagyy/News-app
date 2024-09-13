import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_routes_name.dart';

class SplashView extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
    () => Navigator.pushReplacementNamed(context,  PageRoutesName.home)
      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body:Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/pattern.png",
                fit: BoxFit.cover
              ),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              )

            ],
          )
        ) ;
  }
}