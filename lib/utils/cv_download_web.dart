import 'package:web/web.dart' as web;

Future<void> openCv() async {
  final anchor = web.HTMLAnchorElement()
    ..href = Uri.base.resolve('Nader_Mohamed.pdf').toString()
    ..download = 'Nader_Mohamed.pdf'
    ..target = '_blank';
  web.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
}
