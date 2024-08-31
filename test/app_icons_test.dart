import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:over_flight/resources/resources.dart';

void main() {
  test('app_icons assets test', () {
    expect(File(AppIcons.flyght).existsSync(), isTrue);
    expect(File(AppIcons.google).existsSync(), isTrue);
    expect(File(AppIcons.spashScreen).existsSync(), isTrue);
  });
}
