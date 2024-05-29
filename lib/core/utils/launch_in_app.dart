import 'package:url_launcher/url_launcher.dart';

class UrlLauncherMethods {
  Future<void> launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  String hostFinder(Uri uri) {
    return uri.host;
  }

  String pathFinder(Uri uri) {
    return uri.path;
  }
}
