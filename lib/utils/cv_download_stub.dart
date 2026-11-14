import 'package:url_launcher/url_launcher.dart';

Future<void> openCv() {
  return launchUrl(
    Uri.parse('https://nadermohamedmusa.github.io/Nader_Mohamed.pdf'),
    mode: LaunchMode.externalApplication,
  );
}
