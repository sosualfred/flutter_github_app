import 'package:flutter/material.dart';
import 'package:flutter_github_app/widgets/common/label.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testWidgets('Label widget should render with the expected properties',
      (WidgetTester tester) async {
    // Arrange
    // Generate random string for label text
    const String labelText = 'Python';
    const Color testColor = Colors.blue;
    const double testFontSize = 16.0;

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const Label(
                label: labelText,
                color: testColor,
                fontSize: testFontSize,
              );
            },
          ),
        ),
      ),
    );

    // Assert
    expect(find.text(labelText), findsOneWidget);

    final Text labelWidget = tester.widget(find.text(labelText));
    expect(labelWidget.style?.fontSize, testFontSize);
    expect(labelWidget.style?.color, testColor);
  });
}
