import 'package:flutter/material.dart';
import 'package:servicely_app1/features/home/presentation/sections/request_service_section.dart';

class RequestServiceScreen extends StatelessWidget {
  final String serviceName;
  final String providerName;

  const RequestServiceScreen({
    super.key,
    required this.serviceName,
    required this.providerName,
  });

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
        title: const Text(
          "طلب خدمة",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: RequestServiceSection(
        serviceName: serviceName,
        providerName: providerName,
      ),
    );
  }
}
