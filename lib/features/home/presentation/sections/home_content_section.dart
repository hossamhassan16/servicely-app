import 'package:flutter/material.dart';
import 'package:servicely_app1/features/home/presentation/sections/home_header_section.dart';
import 'package:servicely_app1/features/home/presentation/widgets/category_chip.dart';
import 'package:servicely_app1/features/home/presentation/widgets/city_dropdown.dart';
import 'package:servicely_app1/features/home/presentation/widgets/filter_button.dart';
import 'package:servicely_app1/features/home/presentation/widgets/home_search_bar.dart';
import 'package:servicely_app1/features/home/presentation/widgets/service_card.dart';

class HomeContentSction extends StatefulWidget {
  const HomeContentSction({super.key});

  @override
  State<HomeContentSction> createState() => _HomeContentSctionState();
}

class _HomeContentSctionState extends State<HomeContentSction> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> services = [
    {'name': 'تنظيف منزل', 'category': 'نظافة'},
    {'name': 'سباكة', 'category': 'سباكة'},
    {'name': 'تصليح كهرباء', 'category': 'كهرباء'},
    {'name': 'غسيل سيارات', 'category': 'سيارات'},
    {'name': 'إصلاح مكيفات', 'category': 'أجهزة'},
    {'name': 'تنظيف سجاد', 'category': 'نظافة'},
  ];

  List<String> filteredServices = [];

  final List<String> categories = [
    "نظافة",
    "سباكة",
    "موضة وأزياء",
    "أجهزة",
    "كهرباء",
    "سيارات"
  ];

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    searchService('');
  }

  void updateCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
    searchService(searchController.text);
  }

  void searchService(String query) {
    final category = categories[selectedCategoryIndex];
    final results = services
        .where((service) {
          return service['category'] == category &&
              service['name']!.toLowerCase().contains(query.toLowerCase());
        })
        .map((e) => e['name']!)
        .toList();

    setState(() {
      filteredServices = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F7FB),
        body: SafeArea(
          child: Column(
            children: [
              /// HEADER + SEARCH
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const HomeHeaderSection(),
                  Positioned(
                    bottom: -25,
                    left: 16,
                    right: 16,
                    child: HomeSearchBar(
                      controller: searchController,
                      onChanged: searchService,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 60),
              CategoriesTabBar(
                categories: categories,
                onTap: updateCategory,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    FilterButton(
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    const CityDropdown(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredServices.length,
                  itemBuilder: (context, index) {
                    return ServiceCard(
                      serviceName: filteredServices[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
