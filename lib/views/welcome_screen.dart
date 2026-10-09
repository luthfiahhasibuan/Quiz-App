import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        ,)
      padding: const.EdgeInsets.symmetric(horizontal: defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Udah Siap Belomm??",
            style: Theme.of(context).textTheme.headlineMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          const Text("Kita kenalan dulu ya.."),
          const Spacer(),

          TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFF4E693E),
              hintText: "Masukkan nama Anda",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
