import 'package:flutter/material.dart';
import 'package:flutter_github_app/widgets/common/chips.dart';
import 'package:flutter_github_app/widgets/common/label.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Label widget should render with the expected properties',
      (WidgetTester tester) async {
    // Arrange
    const List<String> labels = ['Python', 'Dart', 'Flutter'];
    const Color testColor = Colors.blue;

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const Chips(
                labels: labels,
                color: testColor,
              );
            },
          ),
        ),
      ),
    );

    // Assert
    for (final label in labels) {
      expect(find.text(label), findsOneWidget);
    }
  });
}
