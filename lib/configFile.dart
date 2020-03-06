import 'dart:io';

import 'package:yaml/yaml.dart';

class ConfigFile {
  static String initConfig() {
    final platform = Platform.operatingSystem;
    List<String> defaultIgnoredDrives;
    String configPath;
    // Setting defaultIgnoredDrives and file path to config file
    switch (platform) {
      case 'macos':
        {
          defaultIgnoredDrives = <String>[
            'BOOTCAMP',
            'Macintosh HD',
            'com.apple.TimeMachine.localsnapshots'
          ];
          configPath =
              Directory.current.path.split('/').getRange(0, 3).join('/');
        }
    }
    var lines = [
      '# More info at https://github.com/Matt-Gleich/Drive-Move/blob/master/README.md',
      'ignoredDrives:',
    ];
    if (defaultIgnoredDrives.isNotEmpty) {
      for (var drive in defaultIgnoredDrives) {
        lines.add('  - $drive');
      }
    }
    // Crating and writing template to ~/.driveMove/config.yml
    configPath = configPath + '/.driveMove/config.yml';
    if (FileSystemEntity.typeSync(configPath) !=
        FileSystemEntityType.notFound) {
      File(configPath).delete(recursive: true);
    }
    File(configPath).create(recursive: true);
    var file = File(configPath);
    var sink = file.openWrite(mode: FileMode.append);
    for (var line in lines) {
      sink.write('$line\n');
    }
    return configPath;
  }

  static Future<Map> readConfig(String configPath) async {
    var file = File(configPath);
    await file.readAsLines().then((line) => print('line = $line'));
    var yamlString = file.readAsStringSync();
    var yaml = loadYaml(yamlString);
    return yaml;
  }
}

// Future<void> main() async {
//   var configPath = ConfigFile.initConfig();
//   print((await ConfigFile.readConfig(configPath))['ignoredDrives']);
// }
