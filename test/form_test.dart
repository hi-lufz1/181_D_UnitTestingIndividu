import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_example/main.dart';
import 'package:form_example/view_page.dart';

void main() {
  group('Form Widget Tests', () {
    testWidgets('Widget ditampilkan dengan benar', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verifikasi bahwa semua field form ditampilkan
      expect(find.byKey(const Key('nameField')), findsOneWidget);
      expect(find.byKey(const Key('accountTypeField')), findsOneWidget);
      expect(find.text('Submit Data'), findsOneWidget);
    });

    testWidgets('Kirim formulir dengan bidang kosong menampilkan dialog peringatan',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Gulir untuk memastikan tombol terlihat
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -500));
      await tester.pumpAndSettle();

      // Tekan tombol submit tanpa memasukkan data
      await tester.tap(find.text('Submit Data'));
      await tester.pump();

      // Verifikasi bahwa dialog peringatan ditampilkan
      expect(find.text('Warning !!'), findsOneWidget);
      expect(
          find.text('Please, input all your data needed...'), findsOneWidget);

      // Tekan tombol OK pada dialog peringatan
      await tester.tap(find.text('OK'));
      await tester.pump();

      // Verifikasi bahwa dialog peringatan ditutup
      expect(find.text('Warning !!'), findsNothing);
    });

    testWidgets('FormScreen menavigasi ke ViewPage dengan data yang benar',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(find.byKey(const Key('nameField')), 'John Doe');
      await tester.enterText(
          find.byKey(const Key('identityNumberField')), '123456789');
      await tester.enterText(
          find.byKey(const Key('birthDateField')), '1990-01-01');
      await tester.enterText(find.byKey(const Key('genderField')), 'Male');
      await tester.enterText(
          find.byKey(const Key('phoneNumberField')), '1234567890');
      await tester.enterText(
          find.byKey(const Key('lastEducationField')), 'Bachelor');
      await tester.enterText(
          find.byKey(const Key('religionField')), 'Christian');
      await tester.enterText(find.byKey(const Key('jobField')), 'Engineer');
      await tester.enterText(
          find.byKey(const Key('addressField')), '123 Main St');
      await tester.enterText(find.byKey(const Key('accountTypeField')), 'User');

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('123456789'), findsOneWidget);
      expect(find.text('1990-01-01'), findsOneWidget);
      expect(find.text('Male'), findsOneWidget);
      expect(find.text('1234567890'), findsOneWidget);
      expect(find.text('Bachelor'), findsOneWidget);
      expect(find.text('Christian'), findsOneWidget);
      expect(find.text('Engineer'), findsOneWidget);
      expect(find.text('123 Main St'), findsOneWidget);
      expect(find.text('User'), findsOneWidget);
    });
  });
}