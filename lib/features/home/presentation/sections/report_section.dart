import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/gen/assets.gen.dart';

class ReportSection extends StatefulWidget {
  final BuildContext parentContext;

  const ReportSection({
    super.key,
    required this.parentContext,
  });

  @override
  State<ReportSection> createState() => _ReportSectionState();
}

class _ReportSectionState extends State<ReportSection> {
  String? selectedReason;
  late TextEditingController descriptionController;
  final List<String> reportReasons = [
    "سعر مبالغ فيه",
    "تأخير",
    "سوء خدمة",
  ];

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void _submitReport() {
    Navigator.pop(context);
    ScaffoldMessenger.of(widget.parentContext).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Assets.images.report.image(
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "تم إستلام الإبلاغ بنجاح، سيتم مراجعته من قبل الإدارة والرد عليك خلال 24 ساعة",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Text(
                "الإبلاغ عن الخدمة",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                DropdownButtonFormField<String>(
                  value: selectedReason,
                  hint: const Text("اختر سبب الإبلاغ"),
                  items: reportReasons
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: secondaryColorHex),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColorHex),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "اكتب سبب الإبلاغ...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _submitReport,
              child: Container(
                width: 345,
                height: 53,
                decoration: BoxDecoration(
                  color: primaryColorHex,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "إرسال ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
