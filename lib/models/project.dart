class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final String? androidUrl;
  final String? iosUrl;
  final String? webUrl;
  final String? videoUrl;
  final List<String> technologies;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.androidUrl,
    this.iosUrl,
    this.webUrl,
    this.videoUrl,
    required this.technologies,
  });
}
