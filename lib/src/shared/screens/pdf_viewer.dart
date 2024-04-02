import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class PDFViewerWithProgressBar extends StatefulWidget {
  const PDFViewerWithProgressBar({super.key});

  @override
  State<PDFViewerWithProgressBar> createState() =>
      _PDFViewerWithProgressBarState();
}

class _PDFViewerWithProgressBarState extends State<PDFViewerWithProgressBar> {
  String? path;
  bool isLoading = false;

  void selectPDF() async {
    setState(() {
      isLoading = true;
    });

    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      path = result.files.single.path!;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Importer CV'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CupertinoButton.filled(
                onPressed: selectPDF,
                child: const Text('Importer PDF'),
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : path != null
                      ? Expanded(
                          child: PDFView(
                            filePath: path!,
                          ),
                        )
                      : Container(),
              if (path != null)
                CupertinoButton.filled(
                  onPressed: () {
                    Get.back(result: path);
                  },
                  child: const Text('Valider'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
