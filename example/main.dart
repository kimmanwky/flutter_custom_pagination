import 'package:flutter/material.dart';
import 'package:flutter_custom_pagination/flutter_custom_pagination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Pagination Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Custom Pagination Demo'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlutterCustomPagination(
          currentPage: 1,
          limitPerPage: 10,
          totalDataCount: 100,
          onPreviousPage: (int page) {
            print('Previous Page: $page');
          },
          onNextPage: (int page) {
            print('Next Page: $page');
          },
        ),
      ),
    );
  }
}
