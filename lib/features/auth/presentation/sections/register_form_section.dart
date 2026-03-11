import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/app_text_field.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/phone_input_field.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/primary_button.dart';

class RegisterFormSection extends StatefulWidget {
  const RegisterFormSection({super.key});

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  bool isAccepted = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      context.go(
        RouterNames.OTP,
        extra: phoneController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 132,
                  height: 98,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff818181)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "الصورة الشخصية",
                        style:
                            TextStyle(color: Color(0xff818181), fontSize: 14),
                      ),
                      SvgPicture.asset(
                        "assets/images/image-icon.svg",
                        width: 15,
                        height: 15,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const NameInputField(hintText: "الإسم الأول"),
                const SizedBox(height: 16),
                const NameInputField(hintText: "الإسم الثانى"),
                const SizedBox(height: 16),
                PhoneInputField(controller: phoneController),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "هل أنت موافق على الشروط والأحكام ؟",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Checkbox(
                      value: isAccepted,
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          isAccepted = value!;
                        });
                      },
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Color(0xff818181),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                PrimaryButton(
                  text: 'إنشاء',
                  color: const Color(0xff0271F7),
                  textColor: Colors.white,
                  onPressed: _register,
                ),
                // const Spacer(),
              ],
            ),
          )),
    );
  }
}
