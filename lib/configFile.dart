import 'dart:io';

class ConfigFile {
  static Map initConfig() {
    final platform = Platform.operatingSystem;
    List<String> defaultIgnoredDrives;
    switch (platform) {
      case 'macos':
        {
          defaultIgnoredDrives = <String>[
            'BOOTCAMP',
            'Macintosh HD',
            'com.apple.TimeMachine.localsnapshots'
          ];
        }
    }
    if (defaultIgnoredDrives.isNotEmpty) {
      var lines = [
        '# More info at https://github.com/Matt-Gleich/Drive-Move/blob/master/README.md',
        'ignoredDrives:'
      ];
      for (var ignoredDrive in defaultIgnoredDrives) {
        lines.add('  - $ignoredDrive');
      }
    }
  }
}
