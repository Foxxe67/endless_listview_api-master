import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyadviceView extends StatefulWidget {
  final int index;
  const MyadviceView(this.index, {super.key});

  @override
  State<StatefulWidget> createState() => _MyadviceViewState();
}

class _MyadviceViewState extends State<MyadviceView> {
  late int itemId;
  late Uint8List imageData;
  bool canLoad = false;
  _asyncMethod() async {
    Map<String, String> requestHeaders = {
      'Accept': 'image/*',
    };
    var url = Uri.parse("https://api.adviceslip.com/advice/$itemId");

    var response = await get(url, headers: requestHeaders);

    if (mounted) {
      setState(() {
        imageData = response.bodyBytes;
        canLoad = true;
      });
    }
  }

  @override
  void initState() {
    itemId = widget.index;
    _asyncMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (canLoad) {
      return Table(
        children: [
          TableRow(children: [
            Text('advice $itemId'),
            Image.memory(imageData, width: 100, height: 100)
          ])
        ],
      );
    } else {
      return const Center(
        child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
                backgroundColor: Colors.cyan, strokeWidth: 5)),
      );
    }
  }
}
