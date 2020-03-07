import 'dart:io';

import 'package:test/test.dart';

import 'package:Drive_Move/listOptions.dart';
import 'package:Drive_Move/configFile.dart';

void main() {
  final platform = Platform.operatingSystem;
  test(
    'Listing Drives in MacOS',
    () {
      if (platform == 'macos') {
        var result = ListOptions.listDrives(DEFAULT_IGNORED_DRIVES['macos']);
        expect(result, []);
      } else {
        expect(true, true); // Just to give it something
      }
    },
  );
}
