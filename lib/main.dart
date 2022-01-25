import 'package:flutter/material.dart';

import 'pages/pdfview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Examples'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPackageSession(
                'flutter_cached_pdfview:',
                onAsset: () {
                  _pushPage(PDFViewPage());
                },
                onURL: () {},
              ),
              _buildPackageSession(
                'native_pdf_view:',
                onAsset: () {},
                onURL: () {},
              ),
              _buildPackageSession(
                'advance_pdf_viewer:',
                onAsset: () {},
                onURL: () {},
              ),
              _buildFlutterPdfViewSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPackageSession(
    String titulo, {
    void Function()? onURL,
    void Function()? onAsset,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titulo,
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: onURL,
              child: Text('from URL'),
            ),
            ElevatedButton(
              onPressed: onAsset,
              child: Text('from Asset'),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }

  void _pushPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  Widget _buildFlutterPdfViewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'flutter_pdfview',
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                _pushPage(PDFViewPage());
              },
              child: Text('Go to options'),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
