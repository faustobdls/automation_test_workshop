import 'package:flutter/material.dart';
import 'package:automation_test_workshop/fulano_button/fulano_button.dart';

class FulanoButtonPageMock extends StatefulWidget {
  final FulanoButton? button;
  const FulanoButtonPageMock({Key? key, this.button}) : super(key: key);

  @override
  FulanoButtonPageMockState createState() => FulanoButtonPageMockState();
}

class FulanoButtonPageMockState extends State<FulanoButtonPageMock> {
  int counter = 0;

  FulanoButtonStyle buttonState = FulanoButtonStyle.standard;

  changeButtonState() async {
    setState(() {
      counter++;
      buttonState = (counter.isEven)
          ? FulanoButtonStyle.standard
          : FulanoButtonStyle.loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            widget.button?.copyWith(onTap: () async {
                  widget.button?.onTap?.call();
                  await changeButtonState();
                }) ??
                FulanoButton(
                  label: "Aqui jás um botão.",
                  style: buttonState,
                  onTap: changeButtonState,
                ),
          ],
        ),
      ),
    );
  }
}
