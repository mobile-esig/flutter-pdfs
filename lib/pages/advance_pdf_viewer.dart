import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class AdvancePdfViewer extends StatefulWidget {
  const AdvancePdfViewer({Key? key}) : super(key: key);

  @override
  _AdvancePdfViewerState createState() => _AdvancePdfViewerState();
}

class _AdvancePdfViewerState extends State<AdvancePdfViewer> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/demo-link.pdf');

    setState(() => _isLoading = false);
  }

  openPDF(value) async {
    setState(() => _isLoading = true);
    if (value == 1) {
      document = await PDFDocument.fromAsset('assets/demo-landscape.pdf');
    } else if (value == 2) {
      document = await PDFDocument.fromURL(
        'https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf',
        // cacheManager: CacheManager(
        //   Config(
        //     'customCacheKey',
        //     stalePeriod: const Duration(days: 2),
        //     maxNrOfCacheObjects: 10,
        //   ),
        // ),
      );
    } else {
      document = await PDFDocument.fromAsset('assets/demo-link.pdf');
    }
    setState(() => _isLoading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 36),
            ListTile(
              title: Text('Load from Assets'),
              onTap: () {
                openPDF(1);
              },
            ),
            ListTile(
              title: Text('Load from URL'),
              onTap: () {
                openPDF(2);
              },
            ),
            ListTile(
              title: Text('Restore default'),
              onTap: () {
                openPDF(3);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('FlutterPluginPDFViewer'),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                //uncomment below line to preload all pages
                lazyLoad: false,
                // uncomment below line to scroll vertically
                // scrollDirection: Axis.vertical,

                //uncomment below code to replace bottom navigation with your own
                /* navigationBuilder:
                          (context, page, totalPages, jumpToPage, animateToPage) {
                        return ButtonBar(
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.first_page),
                              onPressed: () {
                                jumpToPage()(page: 0);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                animateToPage(page: page - 2);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                animateToPage(page: page);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.last_page),
                              onPressed: () {
                                jumpToPage(page: totalPages - 1);
                              },
                            ),
                          ],
                        );
                      }, */
              ),
      ),
    );
  }
}
