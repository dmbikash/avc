import 'package:url_launcher/url_launcher.dart';

void luaunchURL(URL) async {
  final Uri url = Uri.parse(URL);
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}