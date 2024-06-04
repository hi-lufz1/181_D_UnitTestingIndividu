import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:form_example/main.dart';
import 'package:form_example/view_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Form input dan submit', (WidgetTester tester) async {
    // Arrange: Load the MyApp widget
    await tester.pumpWidget(const MyApp());

    // Act: Enter text in all the TextFields
    await tester.enterText(find.byKey(const Key('nameField')), 'John Doe');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(
        find.byKey(const Key('identityNumberField')), '123456789');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(
        find.byKey(const Key('birthDateField')), '01/01/1990');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(find.byKey(const Key('genderField')), 'Male');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(
        find.byKey(const Key('phoneNumberField')), '555-555-5555');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(
        find.byKey(const Key('lastEducationField')), 'Bachelor');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(find.byKey(const Key('religionField')), 'Islam');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(find.byKey(const Key('jobField')), 'Engineer');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(
        find.byKey(const Key('addressField')), '123 Main St');
    await Future.delayed(const Duration(milliseconds: 500));
    await tester.enterText(
        find.byKey(const Key('accountTypeField')), 'Savings');
    await Future.delayed(const Duration(milliseconds: 500));

    // Act: Tap the submit button
    await tester.tap(find.text('Submit Data'));
    await Future.delayed(const Duration(milliseconds: 500));

    // Allow navigation to complete
    await tester.pumpAndSettle();

    // Assert: Verify that the ViewPage is displayed with the correct data
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123456789'), findsOneWidget);
    expect(find.text('01/01/1990'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('555-555-5555'), findsOneWidget);
    expect(find.text('Bachelor'), findsOneWidget);
    expect(find.text('Islam'), findsOneWidget);
    expect(find.text('Engineer'), findsOneWidget);
    expect(find.text('123 Main St'), findsOneWidget);
    expect(find.text('Savings'), findsOneWidget);
  });

  testWidgets('Form input missing data', (WidgetTester tester) async {
    // Arrange: Load the MyApp widget
    await tester.pumpWidget(const MyApp());

    // Act: Enter text in some of the TextFields
    await tester.enterText(find.byKey(const Key('nameField')), 'John Doe');
    await tester.enterText(
        find.byKey(const Key('identityNumberField')), '123456789');

    // Act: Tap the submit button
    await tester.tap(find.text('Submit Data'));
    await Future.delayed(const Duration(milliseconds: 500));

    // Allow navigation to complete
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 500));

    // Assert: Verify that the warning dialog is displayed
    expect(find.text('Warning !!'), findsOneWidget);
    expect(find.text('Please, input all your data needed...'), findsOneWidget);
    await Future.delayed(const Duration(milliseconds: 500));
  });
}