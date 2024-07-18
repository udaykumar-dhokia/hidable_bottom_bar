import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hidable_bottom_bar/hidable_bottom_bar.dart';

void main() {
  test('adds one to input values', () {
    HidableBottomBar(
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
    );
  });
}
