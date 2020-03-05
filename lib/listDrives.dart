import 'dart:io';

class ListDrives {
  static List<String> _getMacOSDrives(List<String> ignoredDrives) {
    var validDrives = <String>[];
    var volumesContent = Directory('/Volumes').listSync();
    for (var fileOrDir in volumesContent) {
      var cleanedPath = fileOrDir.path.toString().replaceAll('/Volumes/', '');
      if (fileOrDir is Directory &&
          ignoredDrives.contains(cleanedPath) == false) {
        validDrives.add(cleanedPath);
      }
    }
    return validDrives;
  }

  static List<String> listDrives(List<String> ignoredDrives) {
    final platform = Platform.operatingSystem;
    switch (platform) {
      case 'macos':
        {
          return _getMacOSDrives(ignoredDrives);
        }
      default:
        {
          print('Not supported for $platform');
          exit(1);
        }
    }
  }
}
