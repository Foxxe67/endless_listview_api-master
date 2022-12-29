import 'dart:io';

import 'package:flutter/material.dart';

import 'MyadviceView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endless ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Endless ListView Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyadviceView> myadvices = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: 123 * 2,
            itemBuilder: (context, i) {
              if (i.isOdd) return const Divider();
              final int index = i ~/ 2;
              if (index >= myadvices.length) {
                myadvices.addAll([
                  MyadviceView(index + 1),
                  MyadviceView(index + 2),
                  MyadviceView(index + 3)
                ]);
              }
              print(
                  'просят индекс $i отдаем индекс $index длина массива ${myadvices.length}');
              return ListTile(
                title: myadvices[index],
              );
            }));
  }
}
