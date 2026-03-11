import 'package:flutter/material.dart';

class OtpInputRow extends StatefulWidget {
  final TextEditingController controller;
  const OtpInputRow({super.key, required this.controller});

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (index) => TextEditingController());
    _focusNodes = List.generate(4, (index) => FocusNode());
    for (int i = 0; i < 4; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1 && i < 3) {
          _focusNodes[i + 1].requestFocus();
        }
        _updateMainController();
      });
    }
  }

  void _updateMainController() {
    String otp = _controllers.map((c) => c.text).join();
    widget.controller.text = otp;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(4, (index) {
        return Container(
          width: 55,
          height: 67,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF18B791)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: "__",
              hintStyle: TextStyle(
                fontSize: 24,
                color: Color(0xFF18B791),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF18B791)),
          ),
        );
      }),
    );
  }
}
