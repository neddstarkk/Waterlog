// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:waterlog/presentation/waterlog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:waterlog/presentation/widgets/text_option.dart';
import 'package:waterlog/services/user_provider.dart';
import 'package:waterlog/presentation/widgets/list_view_builder.dart';

void main() {

  // Test 1
  testWidgets('Waterlog widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Waterlog(),
      ),
    );

    // Verify the presence of certain widgets in the tree.
    expect(find.text('Personal Data'), findsOneWidget);
    expect(find.byType(PersonalDetailsEntry), findsOneWidget);
    expect(find.byType(NextButton), findsOneWidget);
  });

  // Test 2
  testWidgets('Waterlog widget with Provider', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Waterlog(),
      ),
    );

    // Verify that ChangeNotifierProvider<UserProvider> is in the widget tree.
    expect(find.byType(ChangeNotifierProvider<UserProvider>), findsOneWidget);
  });

  // Test 3
  testWidgets('TextOption widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TextOption(
                        title: 'Test Title',
                        operation: (String val) {
                          // Verify that the operation is called with the correct value
                          expect(val, '42 TestUnit'); // Replace with expected values
                        },
                        prevVal: '42',
                        unit: 'TestUnit',
                      );
                    },
                  );
                },
                child: const Text('Show TextOption'),
              );
            },
          ),
        ),
      ),
    );

    // Tap the button to show the TextOption dialog.
    await tester.tap(find.text('Show TextOption'));
    await tester.pumpAndSettle();

    // Enter a value in the TextField
    await tester.enterText(find.byType(TextField), '42');

    // Tap the "Confirm" button
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    // The operation callback should have been called with the entered value.
  });
}