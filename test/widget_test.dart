// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:split/login/login.dart';
import 'package:split/home/home.dart';
import 'package:split/contact/contact_page.dart';
import 'package:split/settings/settings_page.dart';

void main() {

testWidgets('Check if every elements in home page are here + Click On Connect', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: LogIn(),
    ),
  ));
    expect(find.text('Mot de passe oublié ?'), findsOneWidget);
    expect(find.text('Nouveau ? Créer un compte'), findsOneWidget);
    expect(find.text('Connexion'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    await tester.tap(find.byType(RaisedButton));
    await tester.pumpAndSettle();
  });
testWidgets('Navigation to Page Home', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: Home(),
    ),
  ));
   expect(find.byType(AppBar), findsOneWidget);
   expect(find.byType(PageView), findsOneWidget);
  });

  testWidgets('Contacts', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: ContactPage(),
    ),
  ));
   expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('SettingsPage', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MaterialApp(
    home: Scaffold(
      body: SettingsPage(),
    ),
  ));
  ////
  //Wait for the Page
  ////
  });
}
