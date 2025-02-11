import 'package:flutter/material.dart';
import '../../components/custom_header.dart';
import '../../components/text_form_field_component.dart';
import '../../theme/colors.dart';


class MotamotPage extends StatefulWidget {
  const MotamotPage({super.key});

  @override
  MotamotPageState createState() => MotamotPageState();
}

class MotamotPageState extends State<MotamotPage> {

  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  String? selectedGender;

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ThemeColor.backGroundColor,
      body: Column(
        children: [
          const CustomHeader(
            backButton: false,
            title: 'মতামত',
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
                        'Motamot',
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
                        controller: subjectController,
                        keyBoardType: TextInputType.text,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      /// Age Field
                      TextFormFields(
                        fieldPreset: 1,
                        title: "বিষয়",
                        controller: descriptionController,
                        keyBoardType: TextInputType.text,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      /// Phone Number Field
                      TextFormFields(
                        maxLines: 5,
                        fieldPreset: 1,
                        title: "মতামত",
                        controller: detailsController,
                        keyBoardType: TextInputType.text,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 32),

                      /// Register Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {Navigator.pop(context);},

                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primary,
                            foregroundColor: ThemeColor.white,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'জমা দিন',
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
