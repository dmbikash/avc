import 'package:avc/components/appbar.dart';
import 'package:avc/theme/colors.dart';
import 'package:avc/views/faq/faq_details.dart';
import 'package:avc/views/faq/faq_topic_page.dart';
import 'package:avc/views/video/video.dart';
import 'package:flutter/material.dart';

import '../components/custom_header.dart';
import '../components/drawer.dart';
import '../components/logo_list.dart';
import '../components/square_buttons.dart';
import '../services/routes.dart';
import '../theme/textStyles.dart';
import 'acts/law_page.dart';
import 'feedback_and_forms/feedback_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: LogoAppBar(title: "Home", backButton: false, ),
      drawer: CustomDrawer(
        fromPage: "Home",
      ),
      body: Column(
        children: [
          const CustomHeader(
            backButton: false,
            title: 'আমার আইন',
          ),

          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                    color: ThemeColor.grey,
                    border: Border.all(width: 2,color: ThemeColor.primary.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width*.9,
                height: 150,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex:5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "গ্রাম্য আইন কি?",

                              maxLines: 1,
                              style: ThemeTextStyles.keys,
                            ),

                            Text(
                                '''প্রাচীনকাল থেকেই এদেশে পঞ্চায়েত নামে যে সংস্থা প্রচলিত ছিল।তার অন্যতমপ্রধান দায়িত্ব ছিল স্থানীয় বিচার কার্য সম্পাদন ও ঝগড়া-বিবাদের  মীমাংসাকরা। বৃটিশরা যদিও প্রথমে এ দায়িত্ব স্থানীয় সংস্থার উপর অর্পন করেনিকিন্তু বিংশ শতাব্দীর প্রথম ভাগেই ১৯১৯ সালে বঙ্গীয় পল্লী স্বায়ওশাসন আইনেরমাধ্যামে ইউনিয়ন র্বোডকে দেওয়ানি ও ফৌজদারি উভয় প্রকার মামলার বিচার করারক্ষমতা দেওয়া হয় ।  '''
                    ,style: TextStyle(),overflow: TextOverflow.ellipsis,maxLines:4,

                            ),
                            InkWell(onTap: (){
                              
                              route(context, FAQDetails(
                                  image: "asset/images/img.png",
                                  question:  "গ্রাম্য আইন কি?", answer: '''প্রাচীনকাল থেকেই এদেশে পঞ্চায়েত নামে যে সংস্থা প্রচলিত ছিল।তার অন্যতমপ্রধান দায়িত্ব ছিল স্থানীয় বিচার কার্য সম্পাদন ও ঝগড়া-বিবাদের  মীমাংসাকরা। বৃটিশরা যদিও প্রথমে এ দায়িত্ব স্থানীয় সংস্থার উপর অর্পন করেনিকিন্তু বিংশ শতাব্দীর প্রথম ভাগেই ১৯১৯ সালে বঙ্গীয় পল্লী স্বায়ওশাসন আইনেরমাধ্যামে ইউনিয়ন র্বোডকে দেওয়ানি ও ফৌজদারি উভয় প্রকার মামলার বিচার করারক্ষমতা দেওয়া হয় ।  '''));
                            }, child: Text("Read More",style: ThemeTextStyles.keys.copyWith(color: ThemeColor.primary),),),
                          ],
                        ),

                    ),
                    Expanded(
                        flex: 3,
                        child: Text("")),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 40.0,left: MediaQuery.of(context).size.width*.575),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(0),

                  width: 110,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: ThemeColor.primary),
                    color: ThemeColor.grey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 1, // How much the shadow spreads
                        blurRadius: 5, // Soften the shadow
                        offset: Offset(3, 5), // Position: X (right), Y (down)
                      ),
                    ],
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                      child: Image.asset("asset/images/img.png", fit: BoxFit.cover,)),
                ),
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                padding: EdgeInsets.all(8),

                children: [
                  // Container(width: 100,height: 100,color: Colors.red,),
                  SquareButton(
                    icon: Icons.task,
                    onPressed: () {
                      print('Form button pressed');
                      // route(context, const Register());
                      route(context, const Acts());
                    },
                    title: 'আইনসমূহ',
                  ),
                  SquareButton(
                    icon: Icons.query_stats,
                    onPressed: () {
                      print('Form button pressed');
                      // route(context, const Register());
                      route(context, const FaqTopicPage());
                    },
                    title: 'FAQs',
                  ),
                  SquareButton(
                    icon: Icons.video_call,
                    onPressed: () {

                      // route(context, const Register());
                      route(context, const Videos());
                    },
                    title: 'Video',
                  ),
                  SquareButton(
                    icon: Icons.file_copy,
                    onPressed: () {
                      print('Form button pressed');
                      // route(context, const Register());
                      route(context, const FeedbackPage());
                    },
                    title: 'ফরম ও মতামত',
                  ),
                  // SquareButton(
                  //   icon: Icons.app_registration_outlined,
                  //   onPressed: () {
                  //     print('Form button pressed');
                  //     // route(context, const Register());
                  //     route(context, const Home());
                  //   },
                  //   title: 'Register Evacuee',
                  // ),
                  // SquareButton(
                  //   icon: Icons.app_registration_outlined,
                  //   onPressed: () {
                  //     print('Form button pressed');
                  //     // route(context, const Register());
                  //     route(context, const Home());
                  //   },
                  //   title: 'Register Evacuee',
                  // ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
