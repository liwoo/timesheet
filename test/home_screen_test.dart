import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:timesheet/layout/constants.dart';

import 'package:timesheet/main.dart';

void main() {
  testWidgets('Shows the Appropriate Home Page Title',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: HomeScreen()));
    expect(find.text(strings[appStrings.appTitle]), findsOneWidget);
  });

  testWidgets('Shows Empty State when no Entries Provided',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: new HomeScreenContent()));
    expect(find.text(strings[appStrings.emptyEntries]),
        findsOneWidget);
  });

  testWidgets('Shows A list of Entries when Entries are Provided',
      (WidgetTester tester) async {
    List<Task> entries = generateEntries();

    await tester.pumpWidget(MaterialApp(
        home: new HomeScreenContent(
      entries: entries,
    )));
    expect(find.text('Conducting Interviews'), findsOneWidget);

    expect(find.text('Kuunika'), findsNWidgets(2));
  });
}

List<Task> generateEntries() {

  final DateTime meetingStartDate = DateTime(2019, 3, 8, 10, 30);
  final DateTime meetingEndDate = DateTime(2019, 3, 8, 11, 30);

  final DateTime codingStartDate = DateTime(2019, 3, 8, 14, 30);
  final DateTime codingEndDate = DateTime(2019, 3, 8, 16, 30);

  final Project kuunikaProject = Project('Kuunika');

  final Activity admin = Activity('Administration');
  final Activity dev = Activity('Development');

  final List<Task> entries = [
    Task(kuunikaProject, 'Conducting Interviews', admin,
        ActivityDuration(meetingStartDate, meetingEndDate)),
    Task(kuunikaProject, 'Working on Interop Layer', dev,
        ActivityDuration(codingStartDate, codingEndDate))
  ];

  return entries;
}
