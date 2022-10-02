import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(); // ❶ PageController 생성

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
          (timer) {
        int? nextPage = pageController.page?.toInt(); // ➊ 현재 페이지 가져오기

        // ➋
        if (nextPage == null) {
          return;
        }

        // ➌
        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }

        pageController.animateToPage( // ➍ 페이지 변경
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        controller: pageController, // ❷ PageController 등록
        children: [1, 2, 3, 4, 5]
            .map(
              (number) => Image.asset(
                'asset/img/image_$number.jpeg',
                fit: BoxFit.cover,
              ),
            )
            .toList(),
      ),
    );
  }
}
