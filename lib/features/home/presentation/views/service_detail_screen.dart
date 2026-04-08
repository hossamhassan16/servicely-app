import 'package:flutter/material.dart';
import 'package:servicely_app1/features/home/presentation/sections/service_detail_section.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceName;
  final String serviceType;
  final String location;
  final String date;
  final String description;
  final String providerName;
  final String providerRating;
  final String providerImage;

  const ServiceDetailScreen({
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
  Widget build(BuildContext context) {
    return ServiceDetailSection(
      serviceName: serviceName,
      serviceType: serviceType,
      location: location,
      date: date,
      description: description,
      providerName: providerName,
      providerRating: providerRating,
      providerImage: providerImage,
    );
  }
}
