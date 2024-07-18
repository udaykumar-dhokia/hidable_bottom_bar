<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Flutter package that provides a customizable bottom bar that hides when the user scrolls down and reappears when the user scrolls up.

## Features

1) Hides the bottom bar on scroll down
2) Shows the bottom bar on scroll up
3) Customizable bottom bar height and animation duration


## Getting started

dependencies:
  hidable_bottom_bar: ^1.0.0

## Usage

HidableBottomBar(
  height: 60.0,
  duration: Duration(milliseconds: 300),
  child: ListView.builder(
    itemCount: 50,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Item $index'),
      );
    },
  ),
);


```dart
import 'package:flutter/material.dart';
import 'package:hidable_bottom_bar/hidable_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HidableBottomBar(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        ),
      ),
    );
  }
}

```