import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:over_flight/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.logo).existsSync(), isTrue);
    expect(File(AppImages.paris).existsSync(), isTrue);
    expect(File(AppImages.spashScreen).existsSync(), isTrue);
    expect(File(AppImages.startBg).existsSync(), isTrue);
    expect(File(AppImages.tokio).existsSync(), isTrue);
  });
}
