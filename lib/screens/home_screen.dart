import 'package:flutter/material.dart';

import '../widgets/hero_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroBanner(
              title: 'Politika Indonesia',
              subtitle: 'Uji wawasanmu di sini',
            ),
          ],
        ),
      ),
    );
  }
}
