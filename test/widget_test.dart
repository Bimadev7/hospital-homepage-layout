import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart'; // Sesuaikan dengan path ke main file aplikasi kamu

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HospitalApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget); // Memastikan counter dimulai dari 0
    expect(find.text('1'),
        findsNothing); // Memastikan 1 tidak ditemukan pada awalnya

    // Simulate a tap on the '+' icon and trigger a frame.
    await tester
        .tap(find.byIcon(Icons.add)); // Menemukan ikon tambah dan melakukan tap
    await tester.pump(); // Memicu frame untuk memperbarui tampilan UI

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing); // Pastikan angka 0 sudah tidak ada
    expect(
        find.text('1'), findsOneWidget); // Pastikan angka 1 sekarang terlihat
  });
}
