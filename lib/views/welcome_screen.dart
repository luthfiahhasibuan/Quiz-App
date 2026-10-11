import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  TextEditingController userNameControler = TextEditingController();
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/bg_screen.jpeg", fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    "Udah Siap Belum?",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text("Kita kenalan dulu ya.."),
                  const Spacer(),

                  TextField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF191720),
                      hintText: "Masukkan nama Anda",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(defaultPadding * 0.75),
                    decoration: BoxDecoration(
                      gradient: PrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Ayo Mulai Kuisnya",
                      style: Theme.of(context).textTheme.labelLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
