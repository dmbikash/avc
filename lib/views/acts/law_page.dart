import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/law_page_provider.dart';
import '../../components/custom_header.dart';
import 'act_components/law_page_component.dart';
import 'acts_json/law_data.dart';

class Acts extends StatelessWidget {
  const Acts({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpansionStateProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeader(
                backButton: false,
                title: 'আইন সমূহ',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: LawPageComponent(lawItems: lawData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
