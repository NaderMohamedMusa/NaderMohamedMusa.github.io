import 'cv_download_stub.dart' if (dart.library.html) 'cv_download_web.dart' as impl;

class CvDownload {
  static Future<void> open() => impl.openCv();
}
