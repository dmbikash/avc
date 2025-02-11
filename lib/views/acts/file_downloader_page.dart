import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/custom_header.dart';
import '../../theme/colors.dart';


class ActsFileDownloadPage extends StatefulWidget {
  const ActsFileDownloadPage({super.key});

  @override
  ActsFileDownloadPageState createState() => ActsFileDownloadPageState();
}

class ActsFileDownloadPageState extends State<ActsFileDownloadPage> {
  // List of downloadable files (data)
  final List<Map<String, String>> downloadableFiles = [
    {
      "title": "VC Act, 2006 - Latest.pdf",
      "filename": "document1.pdf",
      "assetPath": "asset/documents/VC Act, 2006 - Latest.pdf",
    },
    {
      "title": "ডকুমেন্ট 2",
      "filename": "document2.pdf",
      "assetPath": "asset/documents/nbr_tin_certificate_mahbub_bitflex_catchbd.pdf",
    },
    {
      "title": "ডকুমেন্ট 3",
      "filename": "document3.pdf",
      "assetPath": "asset/documents/QOT-RV-000031.pdf",
    },
    {
      "title": "ডকুমেন্ট 4",
      "filename": "document4.pdf",
      "assetPath": "asset/documents/Account_Details.pdf",
    },
  ];




  @override
  void initState() {

    // _requestPermission();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHeader(
            backButton: false,
            title: 'ফাইল ডাউনলোড',
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: downloadableFiles.length,
              itemBuilder: (context, index) {
                final fileData = downloadableFiles[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.file_download, color: ThemeColor.primary),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              fileData["title"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  Future<void> downloadPdfFromAssets() async {
    try {
      // Get the app's documents directory
      Directory appDocDir = await getExternalStorageDirectory() ?? await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // The file name you want to give to the downloaded PDF
      String fileName = 'VC Act, 2006 - Latest.pdf';
      File file = File('$appDocPath/$fileName');

      // Load the PDF from the assets
      final ByteData data = await rootBundle.load('asset/documents/VC Act, 2006 - Latest.pdf');
      final bytes = data.buffer.asUint8List();

      // Write the PDF data to a file
      await file.writeAsBytes(bytes);

      print("PDF saved to $appDocPath/$fileName");

      // Optionally, you can open the file after it's downloaded if needed
      // openFile(file);

    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }


  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      print("Permission granted!");
    } else {
      print("Permission denied!");
    }
  }

}


