import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/home/presentation/views/report_modal_bottom_sheet.dart';
import 'package:servicely_app1/core/utils/assets.gen.dart';

class ServiceDetailSection extends StatefulWidget {
  final String serviceName;
  final String serviceType;
  final String location;
  final String date;
  final String description;
  final String providerName;
  final String providerRating;
  final String providerImage;

  const ServiceDetailSection({
    super.key,
    required this.serviceName,
    required this.serviceType,
    required this.location,
    required this.date,
    required this.description,
    required this.providerName,
    required this.providerRating,
    required this.providerImage,
  });

  @override
  State<ServiceDetailSection> createState() => _ServiceDetailSectionState();
}

class _ServiceDetailSectionState extends State<ServiceDetailSection> {
  int _currentImageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.serviceName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => _currentImageIndex = index);
                      },
                      children: [
                        Assets.images.box.image(fit: BoxFit.cover),
                        Assets.images.box.image(fit: BoxFit.cover),
                        Assets.images.box.image(fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        width: _currentImageIndex == index ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: _currentImageIndex == index
                              ? secondaryColorHex
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Service Details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service Type and Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.serviceType,
                        style: TextStyle(
                          fontSize: 12,
                          color: secondaryColorHex,
                        ),
                      ),
                      Text(
                        widget.serviceName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColorHex.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: secondaryColorHex,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.date,
                              style: TextStyle(
                                fontSize: 11,
                                color: secondaryColorHex,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 12,
                              color: secondaryColorHex,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.location,
                              style: TextStyle(
                                fontSize: 11,
                                color: secondaryColorHex,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Service Description
                  const Text(
                    "وصف الخدمة",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: secondaryColorHex,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Provider Info
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Provider Avatar
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: secondaryColorHex, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        widget.providerImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Provider Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.providerName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.providerRating,
                              style: TextStyle(
                                fontSize: 12,
                                color: secondaryColorHex,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Chat Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffEAF6F3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: secondaryColorHex,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(
                          RouterNames.requestService,
                          extra: {
                            'serviceName': widget.serviceName,
                            'providerName': widget.providerName,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColorHex,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "طلب الخدمة",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ReportModalBottomSheet(),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
