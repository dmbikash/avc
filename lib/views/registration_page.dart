import 'package:flutter/material.dart';

import '../components/custom_header.dart';
import '../components/dropdownfield_component.dart';
import '../components/text_form_field_component.dart';
import '../theme/colors.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    List<String> listOfGender = ["Male", "Female"];

    return Scaffold(
      backgroundColor: ThemeColor.backGroundColor,
      body: Column(
        children: [
          const CustomHeader(
            backButton: false,
            title: 'নিবন্ধন',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Form(
                
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.05),
                      const Text(
                        'AMAR LAW',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Registration Form',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: h * 0.1),

                      /// Name Field
                      TextFormFields(
                        fieldPreset: 1,
                        title: "নাম",
                        controller: nameController,
                        keyBoardType: TextInputType.text,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'এখানে আপনার নাম টি লিখুন';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      /// Age Field
                      TextFormFields(
                        fieldPreset: 1,
                        title: "বয়স",
                        controller: ageController,
                        keyBoardType: TextInputType.number,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'এখানে আপনার বয়স লিখুন';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      /// Gender Field
                      dropDownButton(
                        items: listOfGender,
                        hintText: "লিঙ্গ নির্বাচন করুন",
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "লিঙ্গ নির্বাচন করুন";
                          }
                          return null;
                        },
                        labelText: 'লিঙ্গ',
                      ),
                      const SizedBox(height: 20),

                      /// Phone Number Field
                      TextFormFields(
                        fieldPreset: 1,
                        title: "ফোন নাম্বার",
                        controller: phoneController,
                        keyBoardType: TextInputType.phone,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'এখানে আপনার ফোন নাম্বার লিখুন';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 32),

                      /// Register Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},

                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primary,
                            foregroundColor: ThemeColor.white,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'নিবন্ধন করুন',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
