import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/project.dart';
import '../screens/project_detail_screen.dart';
import '../utils/responsive.dart';
import '../widgets/section_shell.dart';

class PortfolioSection extends StatelessWidget {
  PortfolioSection({super.key});

  final List<Project> projects = [
    Project(
      title: 'Solix ERP',
      description:
          'Modernizing a large-scale ERP from Oracle Forms into a unified cross-platform enterprise app, with scalable workflows, advanced data grids, and dynamic forms for Sales, Finance, Inventory, Purchasing, HR, and POS.',
      technologies: [
        'Flutter',
        'Clean Architecture',
        'Bloc/Cubit',
        'MVVM',
        'PlutoGrid',
        'Syncfusion',
      ],
      imageUrl: 'assets/images/onyx_erp.png',
      webUrl: 'https://solix-erp.s.gy/rFqzx5',
      videoUrl:
          'https://drive.google.com/file/d/1LwTe5cdYSiLswZWtC7hX1UoYqsKM4y2q/view?usp=sharing',
    ),
    Project(
      title: 'Otlob Gas',
      description:
          'Customer app for finding nearby gas distributors, placing orders, tracking drivers live, and communicating through chat and voice messages.',
      technologies: ['GetX', 'Firebase', 'Pusher', 'Google Maps', 'FCM'],
      imageUrl: 'assets/images/otlob_gas_customer.png',
      logoImage: 'assets/images/project_gallery/otlob-gas/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/otlob-gas/screenshot-01.jpg',
        'assets/images/project_gallery/otlob-gas/screenshot-02.jpg',
      ],
      webUrl: 'https://www.otlobgas.com/',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.otlobgas.customer',
      iosUrl:
          'https://apps.apple.com/jo/app/otlob-gas-%D8%A7%D8%B7%D9%84%D8%A8-%D8%BA%D8%A7%D8%B2/id6463805314',
    ),
    Project(
      title: 'OtlobGas Driver',
      description:
          'Driver app for managing gas delivery orders with live location sharing, order status updates, and real-time customer communication.',
      technologies: [
        'GetX',
        'Firebase',
        'Pusher',
        'Background Location',
        'Google Maps',
      ],
      imageUrl: 'assets/images/otlob_gas_driver.png',
      logoImage: 'assets/images/project_gallery/otlobgas-driver/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/otlobgas-driver/screenshot-01.jpg',
        'assets/images/project_gallery/otlobgas-driver/screenshot-02.jpg',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.otlobgas.driver',
      iosUrl: 'https://apple.co/4i0OY8U',
      webUrl: 'https://www.otlobgas.com/',
    ),
    Project(
      title: 'وأتموا',
      description:
          'Authorize qualified proxies for Hajj and Umrah, aligned with Saudi Vision 2030.',
      technologies: ['Cubit', 'Firebase', 'Payments'],
      imageUrl: 'assets/images/watemo.png',
      logoImage: 'assets/images/project_gallery/watemo/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/watemo/screenshot-01.png',
        'assets/images/project_gallery/watemo/screenshot-02.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.myhealth.watemo',
    ),
    Project(
      title: 'Dr Omar Kamel',
      description:
          'Religious and educational app with books, audio, images, and articles.',
      technologies: ['Bloc', 'Firebase'],
      imageUrl: 'assets/images/dr_omar_kamel.png',
      logoImage: 'assets/images/project_gallery/dr-omar-kamel/logo.png',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.okamel.doctoromar',
    ),
    Project(
      title: 'Mdizon',
      description:
          'Medical products, home care supplies, and devices across Egypt and the Arab world.',
      technologies: ['Provider', 'Firebase'],
      imageUrl: 'assets/images/mdizon.png',
      logoImage: 'assets/images/project_gallery/mdizon/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/mdizon/screenshot-01.jpg',
        'assets/images/project_gallery/mdizon/screenshot-02.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.madzun_store.madzun_store',
    ),
    Project(
      title: 'Fekra POS',
      description:
          'ERP-integrated POS for sales transactions, inventory management, and invoice processing, with Sunmi, Bluetooth, and Ethernet printer support.',
      technologies: [
        'Flutter',
        'Provider',
        'MVC',
        'REST APIs',
        'Sunmi',
        'Bluetooth & Ethernet',
      ],
      imageUrl: 'assets/images/fekra_pos.png',
      logoImage: 'assets/images/project_gallery/fekra-pos/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/fekra-pos/screenshot-01.jpg',
        'assets/images/project_gallery/fekra-pos/screenshot-02.jpg',
        'assets/images/project_gallery/fekra-pos/app-store-screenshot-01.jpg',
        'assets/images/project_gallery/fekra-pos/app-store-screenshot-02.jpg',
        'assets/images/project_gallery/fekra-pos/app-store-screenshot-03.jpg',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.fekra.fekrapos_vendor',
      iosUrl: 'https://apps.apple.com/us/app/fekra-pos-vendor/id6445926663',
    ),
    Project(
      title: 'Skylayers POS',
      description:
          'POS for sales, inventory, and invoices with local MySQL and printing.',
      technologies: ['MVVM', 'MySQL'],
      imageUrl: 'assets/images/skylayers_pos.png',
      liveUrl:
          'https://drive.google.com/drive/folders/1sYRaHu0cSvAtHgYWmAY5MDfhy0yVSRoK',
    ),
    Project(
      title: 'Check QR Saudi Invoice',
      description:
          'Scans Saudi electronic invoice QR codes, extracts invoice data, and verifies invoices with local data storage.',
      technologies: ['Provider', 'MVC', 'QR Code Scanner', 'Local Storage'],
      imageUrl: 'assets/images/check_qr_saudi.png',
      logoImage:
          'assets/images/project_gallery/check-qr-saudi-invoice/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/check-qr-saudi-invoice/screenshot-01.jpg',
        'assets/images/project_gallery/check-qr-saudi-invoice/screenshot-02.jpg',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.fekra.check_qr_invoice',
    ),
    Project(
      title: 'Al Reef Al Araby',
      description:
          'Tourism and reservation app for exploring offers, booking tickets, making electronic payments, and entering photo competitions.',
      technologies: [
        'Flutter',
        'Provider',
        'MVC',
        'Firebase Messaging',
        'Payment Gateway',
      ],
      imageUrl: 'assets/images/al_reef.png',
      logoImage: 'assets/images/project_gallery/al-reef-al-araby/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/al-reef-al-araby/screenshot-01.png',
        'assets/images/project_gallery/al-reef-al-araby/screenshot-02.png',
        'assets/images/project_gallery/al-reef-al-araby/home-drive.webp',
        'assets/images/project_gallery/al-reef-al-araby/profile-drive.webp',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.elreefelaraby.elreef_elaraby',
      iosUrl: 'https://apple.co/4277RAL',
    ),
    Project(
      title: 'GDDeaf',
      description:
          'E-commerce app for fashion and electronic devices with product browsing, shopping cart, payment gateway, authentication, and push notifications.',
      technologies: [
        'Flutter',
        'Provider',
        'MVC',
        'REST APIs',
        'Firebase Messaging',
        'Payments',
      ],
      imageUrl: 'assets/images/gddeaf.png',
      logoImage: 'assets/images/project_gallery/gddeaf/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/gddeaf/screenshot-01.png',
        'assets/images/project_gallery/gddeaf/screenshot-02.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.pixel.gddeaf',
      iosUrl: 'https://apps.apple.com/eg/app/gddeaf/id1663969591',
    ),
    Project(
      title: 'HandArtis Seller',
      description:
          'Helps artisans showcase and sell handmade products globally.',
      technologies: ['Payments', 'Wallet'],
      imageUrl: 'assets/images/handartis.png',
      logoImage: 'assets/images/project_gallery/handartis-seller/logo.png',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.ok4d.handartisseller',
    ),
    Project(
      title: 'Shnider',
      description: 'E-commerce app for electrical supplies with cart features.',
      technologies: ['Payments', 'Wallet'],
      imageUrl: 'assets/images/shnider.png',
      logoImage: 'assets/images/project_gallery/shnider/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/shnider/screenshot-01.png',
        'assets/images/project_gallery/shnider/screenshot-02.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.pixel.shnider',
      iosUrl: 'https://apps.apple.com/eg/app/shnider/id6446378250',
    ),
    Project(
      title: 'GFDeaf',
      description: 'App for donating supplies and food to those in need.',
      technologies: ['Payments'],
      imageUrl: 'assets/images/gfdeaf.png',
      logoImage: 'assets/images/project_gallery/gfdeaf/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/gfdeaf/screenshot-01.png',
        'assets/images/project_gallery/gfdeaf/screenshot-02.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.pixel.gfdeaf',
    ),
    Project(
      title: 'Fekrait Road Distance',
      description:
          'Delivery app integrated with Fekrait cloud inventory and POS.',
      technologies: ['Google Maps'],
      imageUrl: 'assets/images/road_distance.png',
      logoImage: 'assets/images/project_gallery/fekrait-road-distance/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/fekrait-road-distance/screenshot-01.png',
        'assets/images/project_gallery/fekrait-road-distance/screenshot-02.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.fekra.road_distance',
    ),
    Project(
      title: 'Dental',
      description:
          'App for dentists to arrange surgeries, locations, and tools.',
      technologies: ['FCM', 'API'],
      imageUrl: 'assets/images/gig_dentist.png',
      logoImage: 'assets/images/project_gallery/dental/logo.png',
      galleryImages: const [
        'assets/images/project_gallery/dental/clinic-edit.webp',
        'assets/images/project_gallery/dental/screenshot-42.webp',
        'assets/images/project_gallery/dental/clinic-profile.webp',
        'assets/images/project_gallery/dental/final-21.webp',
        'assets/images/project_gallery/dental/final-20.webp',
        'assets/images/project_gallery/dental/login-02.webp',
        'assets/images/project_gallery/dental/login.webp',
      ],
      liveUrl:
          'https://drive.google.com/drive/u/0/folders/1yKsFkc-pmqRFiJntQhYwwuoQkpkIWGGL',
    ),
    Project(
      title: 'TAM',
      description: 'Online store for event products, flowers, and decorations.',
      technologies: ['FCM', 'API'],
      imageUrl: 'assets/images/tam.png',
      galleryImages: const [
        'assets/images/project_gallery/tam/screenshot-01.webp',
        'assets/images/project_gallery/tam/screenshot-02.webp',
      ],
      androidUrl: 'https://play.google.com/store/apps/details?id=com.Tam.tam',
      iosUrl: 'https://apps.apple.com/eg/app/tam/id1546390808',
    ),
    Project(
      title: 'Sigma',
      description:
          'E-commerce app with cart and favorite list functionalities.',
      technologies: ['Payments'],
      imageUrl: 'assets/images/sigma.png',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.pixel.sigma',
      iosUrl:
          'https://apps.apple.com/eg/app/sigma-store-%D8%B3%D9%8A%D8%AC%D9%85%D8%A7-%D8%B3%D8%AA%D9%88%D8%B1/id6446433579',
    ),
    Project(
      title: 'MORC',
      description:
          'E-commerce app for products, cart management, and favorites.',
      technologies: ['Payments'],
      imageUrl: 'assets/images/morc.png',
      logoImage: 'assets/images/project_gallery/morc/logo.jpg',
      galleryImages: const [
        'assets/images/project_gallery/morc/app-store-screenshot-01.png',
        'assets/images/project_gallery/morc/app-store-screenshot-02.png',
        'assets/images/project_gallery/morc/app-store-screenshot-03.png',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.pixel.morc',
      iosUrl: 'https://apps.apple.com/eg/app/morc/id6466985168',
    ),
    Project(
      title: 'HandArtis',
      description: 'Online store for handicrafts and international marketing.',
      technologies: ['Firebase', 'Payments'],
      imageUrl: 'assets/images/handartis.png',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.ok4d.handartis',
    ),
    Project(
      title: 'Nasr Group',
      description: 'Track attendance, salaries, leaves, and notifications.',
      technologies: ['Location', 'Background'],
      imageUrl: 'assets/images/nasr.png',
      galleryImages: const [
        'assets/images/project_gallery/nasr-group/screenshot-01.webp',
        'assets/images/project_gallery/nasr-group/screenshot-02.webp',
      ],
      androidUrl: 'https://play.google.com/store/apps/details?id=com.nasr.nasr',
      iosUrl: 'https://apps.apple.com/eg/app/nasr-group/id1555773827',
    ),
    Project(
      title: 'Islamic App',
      description: 'Quran, supplications, hadiths, and prayer guidelines.',
      technologies: ['Notifications'],
      imageUrl: 'assets/images/islamic_app.png',
      galleryImages: const [
        'assets/images/project_gallery/islamic-app/screenshot-01.webp',
        'assets/images/project_gallery/islamic-app/screenshot-02.webp',
      ],
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.nader.islami',
      iosUrl: 'https://bit.ly/4cc4SM7',
    ),
    Project(
      title: 'Dr Math',
      description:
          'Educational competitions that enhance mental arithmetic skills.',
      technologies: ['Bloc', 'Firebase', 'Payments'],
      imageUrl: '',
      androidUrl:
          'https://play.google.com/store/apps/details?id=com.drmath.app',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final featured = projects.take(3).toList();
    final rest = projects.skip(3).toList();
    final columns = Responsive.isMobile(context)
        ? 1
        : (Responsive.isTablet(context) ? 2 : 3);

    return SectionShell(
      color: AppColors.backgroundAlt,
      child: Column(
        children: [
          const SectionEyebrow('Featured Projects'),
          const SizedBox(height: 12),
          Text(
            'Some of My Recent Work',
            style: AppStyles.headline1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          LayoutBuilder(
            builder: (context, constraints) {
              if (columns == 1) {
                return Column(
                  children: featured
                      .asMap()
                      .entries
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: _ProjectCard(
                            project: e.value,
                            index: e.key + 1,
                            featured: true,
                          ),
                        ),
                      )
                      .toList(),
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < featured.length; i++) ...[
                    if (i > 0) const SizedBox(width: 18),
                    Expanded(
                      child: _ProjectCard(
                        project: featured[i],
                        index: i + 1,
                        featured: true,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 48),
          Text('All Projects', style: AppStyles.headline2),
          const SizedBox(height: 24),
          GridView.builder(
            itemCount: rest.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              mainAxisExtent: 320,
            ),
            itemBuilder: (context, index) => _ProjectCard(
              project: rest[index],
              index: index + 4,
              featured: false,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final bool featured;

  const _ProjectCard({
    required this.project,
    required this.index,
    required this.featured,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool hovered = false;

  static const _numberColors = [
    Color(0xFF2563EB),
    Color(0xFF7C3AED),
    Color(0xFF0891B2),
    Color(0xFF059669),
    Color(0xFFD97706),
    Color(0xFFDB2777),
  ];

  Color get _numberColor =>
      _numberColors[(widget.index - 1) % _numberColors.length];

  void _openDetails() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ProjectDetailScreen(
          project: widget.project,
          projectNumber: widget.index,
        ),
      ),
    );
  }

  String? get _primaryLink =>
      widget.project.webUrl ??
      widget.project.liveUrl ??
      widget.project.androidUrl ??
      widget.project.iosUrl ??
      widget.project.videoUrl ??
      widget.project.githubUrl;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: _openDetails,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: hovered
                  ? AppColors.primary.withOpacity(0.5)
                  : AppColors.border,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: widget.featured ? 170 : 140,
                    width: double.infinity,
                    color: const Color(0xFF0B1220),
                    child: project.imageUrl.isEmpty
                        ? const Center(
                            child: Icon(
                              Icons.apps,
                              color: AppColors.muted,
                              size: 40,
                            ),
                          )
                        : Image.asset(
                            project.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: AppColors.muted,
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    left: 12,
                    top: 12,
                    child: Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _numberColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.35),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _numberColor.withOpacity(0.35),
                            blurRadius: 14,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        widget.index.toString().padLeft(2, '0'),
                        style: AppStyles.headline2.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Container(
                            width: 40,
                            height: 40,
                            color: AppColors.backgroundAlt,
                            child:
                                (project.logoImage ?? project.imageUrl).isEmpty
                                ? const Icon(
                                    Icons.apps_rounded,
                                    color: AppColors.primarySoft,
                                  )
                                : Image.asset(
                                    project.logoImage ?? project.imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => const Icon(
                                      Icons.apps_rounded,
                                      color: AppColors.primarySoft,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          child: Text(
                            project.title,
                            style: AppStyles.headline2.copyWith(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.bodyText.copyWith(
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _StoreIcons(project: project),
                        const Spacer(),
                        if (_primaryLink != null)
                          InkWell(
                            onTap: _openDetails,
                            child: Text(
                              'View Gallery →',
                              style: AppStyles.bodyText.copyWith(
                                color: AppColors.primarySoft,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoreIcons extends StatelessWidget {
  final Project project;
  const _StoreIcons({required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (project.androidUrl != null)
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const FaIcon(
              FontAwesomeIcons.googlePlay,
              size: 14,
              color: Color(0xFF22C55E),
            ),
            onPressed: () => launchUrl(Uri.parse(project.androidUrl!)),
          ),
        if (project.iosUrl != null)
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const FaIcon(
              FontAwesomeIcons.appStore,
              size: 14,
              color: Color(0xFF60A5FA),
            ),
            onPressed: () => launchUrl(Uri.parse(project.iosUrl!)),
          ),
        if (project.webUrl != null)
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const FaIcon(
              FontAwesomeIcons.globe,
              size: 14,
              color: AppColors.primarySoft,
            ),
            onPressed: () => launchUrl(Uri.parse(project.webUrl!)),
          ),
      ],
    );
  }
}
