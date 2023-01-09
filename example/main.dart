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
  int currentPage = 1;
  int currentPageLimit = 15;
  int totalDataCount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlutterCustomPagination(
          currentPage: currentPage,
          limitPerPage: currentPageLimit,
          totalDataCount: totalDataCount,
          onPreviousPage: (int page) {
            print('Previous Page: $page');
            setState(() {
              currentPage = page;
            });
          },
          onBackToFirstPage: (int page) {
            print('Back to First Page');
            setState(() {
              currentPage = 1;
            });
          },
          onNextPage: (int page) {
            print('Next Page: $page');
            setState(() {
              currentPage = page;
            });
          },
          onGoToLastPage: (int page) {
            print('Go to Last Page');
            setState(() {
              currentPage = page;
            });
          },
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.brown, fontSize: 18),
          showPageLimitOptions: true,
          pageLimitOptions: const [15, 30, 50],
          onPageLimitChanged: (int? pageLimit) {
            print('Page Limit Changed: $pageLimit');
            setState(() {
              currentPage = 1;
              currentPageLimit = pageLimit ?? 15;
            });
          },
          previousPageIcon: Icons.keyboard_arrow_left,
          backToFirstPageIcon: Icons.first_page,
          nextPageIcon: Icons.keyboard_arrow_right,
          goToLastPageIcon: Icons.last_page,
        ),
      ),
    );
  }
}
