import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo._();

  static late PackageInfo _info;

  static Future<void> init() async {
    _info = await PackageInfo.fromPlatform();
  }

  static String getAppVersion() {
    return _info.version;
  }

  static String getAppBuild() {
    return _info.buildNumber;
  }

  static String getAppName() {
    return _info.appName;
  }
}