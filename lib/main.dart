import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:temp/rotating_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RotatingTextController _controller = RotatingTextController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RotatingText(
              controller: _controller,
              texts: const [
                'Trao đổi, gửi yêu cầu trực tiếp',
                'Quản lý thông báo thông minh',
                'Thanh toán dịch vụ tiện lợi',
              ],
              textStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 20 / 16,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.prev();
            },
            child: const Icon(Icons.navigate_before),
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.next();
            },
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
