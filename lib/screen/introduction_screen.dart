import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> page = [
    PageViewModel(
      title: 'Welcome',
      body:
          'Welcome to best online grocery store. Here you will find all the groceries at one place.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Lets Go')),
      ),
      image: Image.asset("assets/images/all_grocery.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Quick & Fast Delivery',
      body:
          'We offers speedy delivery of your groceries, bathroom supplies, baby care products, pet care items, stationary, etc within 30minutes at your doorstep.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Lets Go')),
      ),
      image: Image.asset("assets/images/grocery.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Fresh Fruits & Vegetables',
      body:
          'Here you can have whatever description you would you like to have, you can type it all in here.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 8,
            ),
            onPressed: () {},
            child: const Text('Lets Go')),
      ),
      image: Image.asset("assets/images/delivery.png"),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STORE'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: page,
        showSkipButton: true,
        skip: const Text('Skip'),
        done: const Text('Done'),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceInOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20)
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BORDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
