import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/project.dart';
import '../utils/responsive.dart';

class PortfolioSection extends StatelessWidget {
  PortfolioSection({super.key});

  final List<Project> projects = [
    Project(
      title: "Onyx ix ERP",
      description: "Migrate Onyx IX ERP from Oracle Forms to Flutter for web, mobile, and desktop with a modern UI, APIs, and better performance. Modules include Stock, Sales, Purchasing, Finance, HR, POS, and more.",
      technologies: ["Clean Arch", "Bloc/Cubit", "MVVM", "Clean Code", "Firebase", "Mason"],
      imageUrl: "assets/images/onyx_erp.png",
      fit: BoxFit.fill,
      webUrl: "https://blueultimate.learnonyx.com:8022/onyx-ix.dv",
      videoUrl: "https://drive.google.com/file/d/1LwTe5cdYSiLswZWtC7hX1UoYqsKM4y2q/view?usp=sharing",
    ),
    Project(
      title: "Otlob Gas",
      description: "OtlobGas Application is the easiest and fastest way to find your nearest gas cylinder distributor around you.",
      technologies: ["Clean Arch", "GetX", "MVVM", "Firebase", "Pusher", "Google Maps"],
      imageUrl: "assets/images/otlob_gas_customer.png",
      fit: BoxFit.none,
      webUrl: "https://www.otlobgas.com/?utm_source=chatgpt.com",
      androidUrl: "https://play.google.com/store/apps/details?id=com.otlobgas.customer",
      iosUrl: "https://apps.apple.com/jo/app/otlob-gas-%D8%A7%D8%B7%D9%84%D8%A8-%D8%BA%D8%A7%D8%B2/id6463805314",
    ),
    Project(
      title: "OtlobGas Driver",
      description: "OtlobGas Driver is an app for gas delivery drivers to receive and manage customer orders efficiently.",
      technologies: ["Clean Arch", "GetX", "MVVM", "Firebase", "Pusher", "Google Maps"],
      imageUrl: "assets/images/otlob_gas_driver.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.otlobgas.driver",
      iosUrl: "https://apple.co/4i0OY8U",
      webUrl: "https://www.otlobgas.com/?utm_source=chatgpt.com",
    ),
    Project(
      title: "وأتموا",
      description: "Enables users to authorize qualified proxies to perform Hajj and Umrah on behalf of the elderly, sick, or deceased, aligned with Saudi Vision 2030 to facilitate religious duties using modern technology.",
      technologies: ["Video & Record Audio Player", "Cubit", "MVVM", "Firebase", "Social Auth", "Payment Gateway", "FCM"],
      imageUrl: "assets/images/watemo.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.myhealth.watemo",
    ),
    Project(
      title: "Dr Omar Kamel",
      description: "Religious and educational app that includes religious books, audio materials, images, and educational articles.",
      technologies: ["Clean Arch", "Bloc/Cubit", "MVVM", "Firebase", "Social Auth"],
      imageUrl: "assets/images/dr_omar_kamel.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.okamel.doctoromar",
    ),
    Project(
      title: "Mdizon",
      description: "App for selling medical products, home care supplies, and medical devices in Egypt and the Arab world.",
      technologies: ["Provider", "MVC", "Firebase", "Social Auth", "Dio"],
      imageUrl: "assets/images/mdizon.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.madzun_store.madzun_store",
    ),
    Project(
      title: "Fekra POS",
      description: "Paid POS app for managing sales, inventory, and invoices. Requires activation via Fekra Software.",
      technologies: ["Provider", "MVC", "Sunmi Printing", "Bluetooth/Ethernet"],
      imageUrl: "assets/images/fekra_pos.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.fekra.fekrapos_vendor",
      iosUrl: "https://apps.apple.com/us/app/fekra-pos-vendor/id6445926663?utm_source=chatgpt.com",
    ),
    Project(
      title: "Skylayers POS",
      description: "Paid POS app for managing sales, inventory, and invoices. Requires activation via Skylayers POS.",
      technologies: ["Provider", "MVVM", "MySQL Local DB", "Printing (Bluetooth/USB/WiFi)", "Notification"],
      imageUrl: "assets/images/project1.png",
      fit: BoxFit.none,
      liveUrl: "https://drive.google.com/drive/folders/1sYRaHu0cSvAtHgYWmAY5MDfhy0yVSRoK",
    ),
    Project(
      title: "Check QR Saudi Invoice",
      description: "A Saudi e-invoice QR code scanner for verification.",
      technologies: ["Provider", "MVC", "QR Code Scanner", "Local Storage"],
      imageUrl: "assets/images/check_qr_saudi.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.fekra.check_qr_invoice",
    ),
    Project(
      title: "Al Reef Al Araby",
      description: "App for booking tickets and offers at good prices, with electronic payment and entry, plus photo contests.",
      technologies: ["Provider", "MVC", "Social Auth", "Payment Gateway"],
      imageUrl: "assets/images/al_reef.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.elreefelaraby.elreef_elaraby",
      iosUrl: "https://apple.co/4277RAL",
    ),
    Project(
      title: "GDDeaf",
      description: "E-commerce App that offers fashion and devices.",
      technologies: ["Provider", "MVC", "Firebase", "Social Auth", "Payment Gateway"],
      imageUrl: "assets/images/gddeaf.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.pixel.gddeaf",
      iosUrl: "https://apps.apple.com/eg/app/gddeaf/id1663969591",
    ),
    Project(
      title: "HandArtis Seller",
      description: "Helps artisans showcase and sell handmade products globally.",
      technologies: ["Provider", "MVC", "Payment Gateway", "Wallet"],
      imageUrl: "assets/images/handartis.png",
      androidUrl: "https://play.google.com/store/apps/details?id=com.ok4d.handartisseller",
    ),
    Project(
      title: "Shnider",
      description: "E-commerce app for electrical supplies with cart features.",
      technologies: ["Provider", "MVC", "Payment Gateway", "Wallet"],
      imageUrl: "assets/images/shnider.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.pixel.shnider",
      iosUrl: "https://apps.apple.com/eg/app/shnider/id6446378250",
    ),
    Project(
      title: "GFDeaf",
      description: "App for donating supplies and food to those in need.",
      technologies: ["Provider", "MVC", "Payment Gateway", "Wallet"],
      imageUrl: "assets/images/gfdeaf.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.pixel.gfdeaf",
    ),
    Project(
      title: "Fekrait Road Distance",
      description: "Delivery app integrated with Fekrait cloud-based inventory and POS.",
      technologies: ["Provider", "MVC", "Google Maps Tracking"],
      imageUrl: "assets/images/road_distance.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.fekra.road_distance",
    ),
     Project(
      title: "Dental",
      description: "App for dentists to arrange surgeries, selecting locations and tools.",
      technologies: ["Provider", "MVC", "FCM", "API Integration"],
      imageUrl: "assets/images/gig_dentist.png",
      fit: BoxFit.none,
      liveUrl: "https://drive.google.com/drive/u/0/folders/1yKsFkc-pmqRFiJntQhYwwuoQkpkIWGGL",
    ),
    Project(
      title: "TAM",
      description: "Online store for event-related products, flowers, and decorations.",
      technologies: ["Provider", "MVC", "FCM", "API Integration"],
      imageUrl: "assets/images/tam.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.Tam.tam",
      iosUrl: "https://apps.apple.com/eg/app/tam/id1546390808",
    ),
    Project(
      title: "Sigma",
      description: "E-commerce app with cart and favorite list functionalities.",
      technologies: ["Provider", "MVC", "Payment Gateway", "Wallet"],
      imageUrl: "assets/images/sigma.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.pixel.sigma",
      iosUrl: "https://apps.apple.com/eg/app/sigma-store-%D8%B3%D9%8A%D8%AC%D9%85%D8%A7-%D8%B3%D8%AA%D9%88%D8%B1/id6446433579",
    ),
    Project(
      title: "MORC",
      description: "E-commerce app for viewing products, cart management, and favorites.",
      technologies: ["Provider", "MVC", "Payment Gateway", "Wallet"],
      imageUrl: "assets/images/morc.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.pixel.morc",
      iosUrl: "https://apps.apple.com/eg/app/morc/id6466985168",
    ),
    Project(
      title: "HandArtis",
      description: "Online store for handicrafts and international marketing.",
      technologies: ["Provider", "MVC", "Firebase", "Payment Gateway"],
      imageUrl: "assets/images/handartis.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.ok4d.handartis",
    ),
    Project(
      title: "Nasr Group",
      description: "Allows customers to track attendance, view salaries, manage leaves, and receive notifications.",
      technologies: ["Provider", "MVC", "Location Tracking", "Background Service"],
      imageUrl: "assets/images/nasr.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.nasr.nasr",
      iosUrl: "https://apps.apple.com/eg/app/nasr-group/id1555773827",
    ),
    Project(
      title: "Islamic App",
      description: "Includes the Quran, supplications, hadiths, and prayer and ablution guidelines.",
      technologies: ["Provider", "MVC", "Notifications", "Background Service"],
      imageUrl: "assets/images/islamic_app.png",
      fit: BoxFit.none,
      androidUrl: "https://play.google.com/store/apps/details?id=com.nader.islami",
      iosUrl: "https://bit.ly/4cc4SM7",
    ),
    Project(
      title: "Dr Math",
      description: "Educational app that includes competitions and enhances children's mental arithmetic skills through quick exercises.",
      technologies: ["Clean Arch", "Bloc/Cubit", "MVVM", "Firebase", "Pusher", "Payment Gateway"],
      imageUrl: "assets/images/project1.png",
      androidUrl: "https://play.google.com/store/apps/details?id=com.drmath.app",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: Responsive.isMobile(context) ? 20 : size.width * 0.1,
      ),
      child: Column(
        children: [
          Text("My Work", style: AppStyles.headline1.copyWith(color: AppColors.secondary)),
          const SizedBox(height: 40),
          MasonryGridView.count(
            crossAxisCount: Responsive.isMobile(context) ? 1 : (Responsive.isTablet(context) ? 2 : 3),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemCount: projects.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _ProjectCard(project: projects[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Image.asset(
              project.imageUrl, 
              fit: project.fit ?? BoxFit.none,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey.withOpacity(0.5)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(project.title, style: AppStyles.headline2.copyWith(fontSize: 20)),
                    ),
                    Row(
                      children: [
                        if (project.androidUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 20, color: Colors.green),
                              onPressed: () => launchUrl(Uri.parse(project.androidUrl!)),
                              tooltip: "Play Store",
                            ),
                          ),
                        if (project.iosUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.appStore, size: 20, color: Colors.blue),
                              onPressed: () => launchUrl(Uri.parse(project.iosUrl!)),
                              tooltip: "App Store",
                            ),
                          ),
                        if (project.webUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.globe, size: 20, color: Colors.blueAccent),
                              onPressed: () => launchUrl(Uri.parse(project.webUrl!)),
                              tooltip: "Website",
                            ),
                          ),
                        if (project.videoUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.youtube, size: 20, color: Colors.red),
                              onPressed: () => launchUrl(Uri.parse(project.videoUrl!)),
                              tooltip: "Watch Video",
                            ),
                          ),
                        if (project.githubUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                              onPressed: () => launchUrl(Uri.parse(project.githubUrl!)),
                              tooltip: "GitHub",
                            ),
                          ),
                        if (project.liveUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare, size: 20),
                              onPressed: () => launchUrl(Uri.parse(project.liveUrl!)),
                              tooltip: "Live Demo",
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(project.description, style: AppStyles.bodyText.copyWith(fontSize: 14)),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies.map((tech) => Chip(
                    label: Text(tech, style: const TextStyle(fontSize: 12)),
                    backgroundColor: AppColors.surface,
                    labelStyle: TextStyle(color: AppColors.textSecondary),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
