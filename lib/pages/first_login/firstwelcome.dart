import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'widgets/slider_helps.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<Widget> _pages = [
    WelcomeSlide(
      imageUrl: 'assets/bg2.png',
      title: 'Find a Ride',
      description: 'Get a taxi anytime, anywhere.',
    ),
    WelcomeSlide(
      imageUrl: 'assets/bgh.png',
      title: 'Track Your Ride',
      description: 'Real-time tracking for your convenience.',
    ),
    WelcomeSlide(
      imageUrl: 'assets/bgDrcard.png',
      title: 'Safe and Reliable',
      description: 'Trustworthy drivers and secure rides.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Automatically scroll through the pages every 3 seconds
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < _pages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: _pages,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => buildDot(index),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Text('Get Started'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
