class Experience {
  final String company;
  final String role;
  final String duration;
  final String type; // Remote, On Site
  final String description;

  const Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.type,
    required this.description,
    this.websiteUrl,
    this.technologies = const [],
  });

  final String? websiteUrl;
  final List<String> technologies;
}
