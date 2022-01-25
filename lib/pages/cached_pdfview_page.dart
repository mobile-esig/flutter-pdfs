import 'package:flutter/material.dart';

class CachedPDFViewPage extends StatelessWidget {
  const CachedPDFViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter_cached_pdfview')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('From URL'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('From Asset'),
            ),
          ],
        ),
      ),
    );
  }
}
