import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/project.dart';
import '../utils/responsive.dart';
import '../widgets/section_shell.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project project;
  final int projectNumber;

  const ProjectDetailScreen({
    super.key,
    required this.project,
    required this.projectNumber,
  });

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  late final PageController _pageController;
  int _selectedImage = 0;

  List<String> get _images => {
    ...widget.project.galleryImages,
    if (widget.project.imageUrl.isNotEmpty) widget.project.imageUrl,
  }.toList();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.72);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _openLink(String? link) async {
    if (link == null) return;
    final uri = Uri.tryParse(link);
    if (uri != null) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final isMobile = Responsive.isMobile(context);
    final images = _images;
    final logo = project.logoImage ?? project.imageUrl;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned.fill(child: _DetailBackdrop()),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 56,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            IconButton.filledTonal(
                              tooltip: 'Back to projects',
                              onPressed: () => Navigator.of(context).maybePop(),
                              icon: const Icon(Icons.arrow_back_rounded),
                            ),
                            const Spacer(),
                            Text(
                              'PROJECT ${widget.projectNumber.toString().padLeft(2, '0')}',
                              style: AppStyles.sectionEyebrow.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        _ProjectHeading(
                          project: project,
                          logo: logo,
                          onOpenLink: _openLink,
                        ),
                        const SizedBox(height: 34),
                        Row(
                          children: [
                            const Expanded(
                              child: SectionEyebrow('Project Gallery'),
                            ),
                            if (images.length > 1)
                              Text(
                                '${_selectedImage + 1} / ${images.length}',
                                style: AppStyles.bodyText.copyWith(
                                  color: AppColors.muted,
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _ScreenshotCarousel(
                          images: images,
                          controller: _pageController,
                          onPageChanged: (index) =>
                              setState(() => _selectedImage = index),
                          onImageTap: _showImage,
                        ),
                        if (images.length > 1) ...[
                          const SizedBox(height: 14),
                          SizedBox(
                            height: 76,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 10),
                              itemBuilder: (context, index) =>
                                  _GalleryThumbnail(
                                    path: images[index],
                                    selected: index == _selectedImage,
                                    onTap: () => _pageController.animateToPage(
                                      index,
                                      duration: const Duration(
                                        milliseconds: 320,
                                      ),
                                      curve: Curves.easeOutCubic,
                                    ),
                                  ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 34),
                        _TechnologiesPanel(technologies: project.technologies),
                        const SizedBox(height: 46),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showImage(String path) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: const Color(0xF5070B16),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 4,
                  child: Image.asset(path, fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton.filledTonal(
                  tooltip: 'Close image',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectHeading extends StatelessWidget {
  final Project project;
  final String logo;
  final Future<void> Function(String?) onOpenLink;

  const _ProjectHeading({
    required this.project,
    required this.logo,
    required this.onOpenLink,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: isMobile ? 72 : 94,
          height: isMobile ? 72 : 94,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.border),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: logo.isEmpty
                ? const Icon(Icons.apps_rounded, color: AppColors.primarySoft)
                : Image.asset(
                    logo,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.apps_rounded,
                      color: AppColors.primarySoft,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(project.title, style: AppStyles.headline1),
              const SizedBox(height: 10),
              Text(project.description, style: AppStyles.bodyText),
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (project.androidUrl != null)
                    _StoreButton(
                      icon: FontAwesomeIcons.googlePlay,
                      label: 'Google Play',
                      onPressed: () => onOpenLink(project.androidUrl),
                    ),
                  if (project.iosUrl != null)
                    _StoreButton(
                      icon: FontAwesomeIcons.appStore,
                      label: 'App Store',
                      onPressed: () => onOpenLink(project.iosUrl),
                    ),
                  if (project.webUrl != null || project.liveUrl != null)
                    _StoreButton(
                      icon: FontAwesomeIcons.globe,
                      label: 'Visit Project',
                      onPressed: () =>
                          onOpenLink(project.webUrl ?? project.liveUrl),
                    ),
                  if (project.videoUrl != null)
                    _StoreButton(
                      icon: FontAwesomeIcons.play,
                      label: 'Watch Demo',
                      onPressed: () => onOpenLink(project.videoUrl),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StoreButton extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final VoidCallback onPressed;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(icon, size: 14),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}

class _ScreenshotCarousel extends StatelessWidget {
  final List<String> images;
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<String> onImageTap;

  const _ScreenshotCarousel({
    required this.images,
    required this.controller,
    required this.onPageChanged,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: _ScreenshotEmptyState(),
      );
    }

    return SizedBox(
      height: Responsive.isMobile(context) ? 360 : 480,
      child: PageView.builder(
        controller: controller,
        itemCount: images.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => onImageTap(images[index]),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: AspectRatio(
                  aspectRatio: 0.53,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF03050A),
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(
                        color: const Color(0xFF3A455B),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.16),
                          blurRadius: 30,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const _ScreenshotEmptyState(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryThumbnail extends StatelessWidget {
  final String path;
  final bool selected;
  final VoidCallback onTap;

  const _GalleryThumbnail({
    required this.path,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 56,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primarySoft : AppColors.border,
            width: selected ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.image_not_supported_outlined,
            color: AppColors.muted,
          ),
        ),
      ),
    );
  }
}

class _TechnologiesPanel extends StatelessWidget {
  final List<String> technologies;

  const _TechnologiesPanel({required this.technologies});

  @override
  Widget build(BuildContext context) {
    if (technologies.isEmpty) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Built with', style: AppStyles.headline2),
          const SizedBox(height: 14),
          Wrap(
            spacing: 9,
            runSpacing: 9,
            children: technologies
                .map(
                  (technology) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundAlt,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      technology,
                      style: AppStyles.bodyText.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ScreenshotEmptyState extends StatelessWidget {
  const _ScreenshotEmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundAlt,
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.phone_iphone_rounded, size: 42, color: AppColors.muted),
          SizedBox(height: 10),
          Text(
            'Screenshots coming soon',
            style: TextStyle(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class _DetailBackdrop extends StatelessWidget {
  const _DetailBackdrop();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.5,
          colors: [Color(0xFF101A30), AppColors.background],
        ),
      ),
    );
  }
}
