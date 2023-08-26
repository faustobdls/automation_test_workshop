import 'package:automation_test_workshop/fulano_button/fulano_button.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  static String routeName = 'buttons_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('buttons'),
      ),
      body: FutureBuilder<int?>(
        future: Future.delayed(const Duration(seconds: 2), ()=>3),
        builder: (ctx, i) => Column(
          children: [
            Center(
              child: FulanoButton(
                label: "BUTTAO",
                style: i.data == null
                    ? FulanoButtonStyle.loading
                    : FulanoButtonStyle.standard,
              ),
            ),
            const Center(
              child: FulanoButton(
                label: "BUTbahsdgjashdgjashdgjashdgjahTAO",
                icon: Icons.home_max,
                style: FulanoButtonStyle.standard,
              ),
            ),
            const Center(
              child: FulanoButton(
                label: "BUTTAO",
                icon: Icons.home_max,
                style: FulanoButtonStyle.standardOutline,
              ),
            ),
            const Center(
              child: FulanoButton(
                label: "BUTTAO",
                style: FulanoButtonStyle.loading,
              ),
            ),
            const Center(
              child: FulanoButton(
                label: "BUTTAO",
                style: FulanoButtonStyle.loadingOutline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
