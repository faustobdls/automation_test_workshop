import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'mocks/fulano_button_page_mock.dart';
import 'package:automation_test_workshop/fulano_button/fulano_button.dart';

void main() {
  test('[FulanoButton] [Lenght states = 18]', () async {
    expect(FulanoButtonStyle.values.length, 18);
  });
  testWidgets('[FulanoButton] [Default Mode] [No Arguments]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton();
    await _createWidget(tester, fulanoButton);
    expect(fulanoButton.label, "");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.onTap, null);
    expect(fulanoButton.fontSize, 14);
    expect(fulanoButton.borderWidth, 2);
    expect(fulanoButton.borderRadius, 4);
    expect(fulanoButton.style, FulanoButtonStyle.standard);
    expect(fulanoButton.padding, const EdgeInsets.all(16));
    expect(fulanoButton.margin, const EdgeInsets.symmetric(horizontal: 16));
    expect(fulanoButton.style.borderColor, Colors.transparent);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight100);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.primaryColorMain);
  });

  testWidgets('[FulanoButton] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.standard);
    expect(fulanoButton.style.borderColor, Colors.transparent);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight100);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.primaryColorMain);
  });
  testWidgets(
      '[FulanoButton] [State: standardSuccess] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.standardSuccess,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.standardSuccess);
    expect(fulanoButton.style.borderColor, Colors.transparent);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight100);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.colorScheme.success);
  });

  testWidgets(
      '[FulanoButton] [State: standardWarning] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.standardWarning,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.standardWarning);
    expect(fulanoButton.style.borderColor, Colors.transparent);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight100);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.colorScheme.warning);
  });

  testWidgets(
      '[FulanoButton] [State: standardDanger] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.standardDanger,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.standardDanger);
    expect(fulanoButton.style.borderColor, Colors.transparent);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight100);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.colorScheme.danger);
  });

  testWidgets(
      '[FulanoButton] [State: standardOutline] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.standardOutline,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.standardOutline);
    expect(fulanoButton.style.labelColor, fulanoButton.style.borderColor);
    expect(fulanoButton.style.labelColor, ColorsTheme.primaryColorMain);
    expect(fulanoButton.style.borderColor, ColorsTheme.primaryColorMain);
    expect(fulanoButton.style.backgroundColor, Colors.transparent);
  });
  testWidgets(
      '[FulanoButton] [State: successOutline] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.successOutline,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.successOutline);
    expect(fulanoButton.style.labelColor, fulanoButton.style.borderColor);
    expect(fulanoButton.style.labelColor, ColorsTheme.colorScheme.success);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.success);
    expect(fulanoButton.style.backgroundColor, Colors.transparent);
  });

  testWidgets(
      '[FulanoButton] [State: warningOutline] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.warningOutline,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.warningOutline);
    expect(fulanoButton.style.labelColor, fulanoButton.style.borderColor);
    expect(fulanoButton.style.labelColor, ColorsTheme.colorScheme.warning);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.warning);
    expect(fulanoButton.style.backgroundColor, Colors.transparent);
  });

  testWidgets(
      '[FulanoButton] [State: dangerOutline] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.dangerOutline,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.dangerOutline);
    expect(fulanoButton.style.labelColor, fulanoButton.style.borderColor);
    expect(fulanoButton.style.labelColor, ColorsTheme.colorScheme.danger);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.danger);
    expect(fulanoButton.style.backgroundColor, Colors.transparent);
  });

  testWidgets('[FulanoButton] [State: loading] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.loading,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(fulanoButton.style, FulanoButtonStyle.loading);
    expect(fulanoButton.style.borderColor, Colors.transparent);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight100);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.primaryColorMain);
  });

  testWidgets(
      '[FulanoButton] [State: loadingSuccess] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.loadingSuccess,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(fulanoButton.style, FulanoButtonStyle.loadingSuccess);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight[100]);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.success);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.colorScheme.success);
  });

  testWidgets(
      '[FulanoButton] [State: loadingOutlineSuccess] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.loadingOutlineSuccess,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(fulanoButton.style, FulanoButtonStyle.loadingOutlineSuccess);
    expect(fulanoButton.style.labelColor, fulanoButton.style.borderColor);
    expect(fulanoButton.style.labelColor, ColorsTheme.colorScheme.success);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.success);
    expect(fulanoButton.style.backgroundColor, Colors.transparent);
  });

  testWidgets(
      '[FulanoButton] [State: loadingWarning] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.loadingWarning,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(fulanoButton.style, FulanoButtonStyle.loadingWarning);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight[100]);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.warning);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.colorScheme.warning);
  });

  testWidgets(
      '[FulanoButton] [State: loadingDanger] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.loadingDanger,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(fulanoButton.style, FulanoButtonStyle.loadingDanger);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfLight[100]);
    expect(fulanoButton.style.borderColor, ColorsTheme.colorScheme.danger);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.colorScheme.danger);
  });

  testWidgets(
      '[FulanoButton] [State: loadingOutline] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.loadingOutline,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(fulanoButton.style, FulanoButtonStyle.loadingOutline);
    expect(fulanoButton.style.labelColor, fulanoButton.style.borderColor);
    expect(fulanoButton.style.labelColor, ColorsTheme.primaryColorMain);
    expect(fulanoButton.style.borderColor, ColorsTheme.primaryColorMain);
    expect(fulanoButton.style.backgroundColor, Colors.transparent);
  });

  testWidgets('[FulanoButton] [State: disabled] [Label = "Aqui jás um botão."]',
      (WidgetTester tester) async {
    FulanoButton fulanoButton = const FulanoButton(
      label: "Aqui jás um botão.",
      style: FulanoButtonStyle.disabled,
    );
    await _createWidget(tester, fulanoButton);

    expect(fulanoButton.label, "Aqui jás um botão.");
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(fulanoButton.style, FulanoButtonStyle.disabled);
    expect(fulanoButton.style.labelColor, ColorsTheme.shadesOfDark[200]);
    expect(fulanoButton.style.borderColor, ColorsTheme.shadesOfLight[500]);
    expect(fulanoButton.style.backgroundColor, ColorsTheme.shadesOfLight[500]);
  });

  testWidgets('[FulanoButton] [Tap Test] 0 => 1 => 2 => 3 => 4',
      (WidgetTester tester) async {
    Key key = const Key("fulanoButton");
    int counter = 0;
    GlobalKey pageMockKey = GlobalKey(debugLabel: "pageMockKey");

    FulanoButton fulanoButton = FulanoButton(
        key: key,
        label: "Aqui jás um botão.",
        onTap: () {
          // final old = counter;
          counter++;
          // if(kDebugMode) print('tap FulanoButton counter: $old > $counter');
        });
    FulanoButtonPageMock pageMock =
        FulanoButtonPageMock(key: pageMockKey, button: fulanoButton);
    await tester.pumpWidget(pageMock);
    await tester.pumpAndSettle();

    expect(counter, 0);
    expect(fulanoButton.style, FulanoButtonStyle.standard);
    await tester.tap(find.byKey(key));
    await tester.pump();

    expect(fulanoButton.style, FulanoButtonStyle.standard);
    expect(counter, 1);
    await tester.tap(find.byKey(key));
    await tester.pump();
    
    expect(fulanoButton.style, FulanoButtonStyle.standard);
    expect(counter, 2);
    await tester.tap(find.byKey(key));
    await tester.pump();
    
    expect(fulanoButton.style, FulanoButtonStyle.standard);
    expect(counter, 3);
    await tester.tap(find.byKey(key));
    await tester.pump();

    expect(fulanoButton.style, FulanoButtonStyle.standard);
    expect(counter, 4);
  });

  testWidgets('[FulanoButton] [Mutating State: standard to loading to loading]',
      (WidgetTester tester) async {
    GlobalKey<FulanoButtonPageMockState> pageMockKey =
        GlobalKey<FulanoButtonPageMockState>(debugLabel: "pageMockKey");
    FulanoButtonPageMock pageMock = FulanoButtonPageMock(key: pageMockKey);
    await tester.pumpWidget(pageMock);
    await tester.pumpAndSettle();
    expect(pageMockKey.currentState!.buttonState, FulanoButtonStyle.standard);
    expect(pageMockKey.currentState!.counter, 0);
    await tester.tap(find.byType(FulanoButton));
    await tester.pump();
    expect(pageMockKey.currentState!.buttonState, FulanoButtonStyle.loading);
    expect(pageMockKey.currentState!.counter, 1);
    await tester.tap(find.byType(FulanoButton));
    await tester.pump();
    expect(pageMockKey.currentState!.buttonState, FulanoButtonStyle.loading);
    expect(pageMockKey.currentState!.counter, 1);
  });
}

Future<void> _createWidget(WidgetTester tester, Widget button) async {
  await tester.pumpWidget(
    Material(
      child: Theme(
        data: ThemeData(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(children: [button]),
        ),
      ),
    ),
  );
}
