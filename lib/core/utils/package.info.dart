import 'package:package_info/package_info.dart';

class PackageInfoApp {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  PackageInfoApp() {
    print(_packageInfo.version);
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    _packageInfo = info;
  }

  String getAppName() {
    return _packageInfo.appName;
  }

  String getPackageName() {
    return _packageInfo.packageName;
  }

  String getVersion() {
    return _packageInfo.version;
    //return FlavorConfig.instance.values.appVersion;
  }

  String getBuildNumber() {
    return _packageInfo.buildNumber;
  }
}
