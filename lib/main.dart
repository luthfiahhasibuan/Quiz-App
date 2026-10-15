import 'package:flutter/material.dart';

import 'utils/app_tema.dart';
import 'utils/responsive.dart';

void main() {
  runApp(MaterialApp(theme: AppTheme.light, home: const DemoPage()));
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final r = context.r;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Teks dari lebar layar',
              style: TextStyle(fontSize: r.width * 0.06),
            ),

            Text(
              'Teks dari sisi terpendek',
              style: TextStyle(fontSize: r.font(6)),
            ),

            Container(
              width: r.width * 0.5,
              height: r.height * 0.2,
              color: AppColors.primary,
            ),
            Text('${r.width.round()} x ${r.height.round()}'),
            Text(r.isLandscape ? 'MENDATAR' : 'TEGAK'),
          ],
        ),
      ),
    );
  }
}
