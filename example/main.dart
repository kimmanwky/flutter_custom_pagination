// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_custom_pagination/flutter_custom_pagination.dart';
import 'package:flutter_custom_pagination/flutter_custom_pagination_options.dart';

// ignore this package, it's just for the example
import 'package:diox/diox.dart';

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
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Accept": "application/json",
      },
    ),
  );

  int currentPage = 1;
  int pageLimit = 10;
  List<int> pageLimitOptions = [10, 25, 50];
  int totalDataCount = 100;
  dynamic sampleData = [];

  @override
  void initState() {
    super.initState();
    _getSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 3,
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              MediaQuery.of(context).size.width >= 600
                  ? _renderLargeScreenPagination()
                  : _renderSmallScreenPagination(),
        ),
      ),
      body: SingleChildScrollView(
        child: sampleData.isEmpty
            ? const SizedBox(
                height: 300, child: Center(child: CircularProgressIndicator()))
            : Column(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: sampleData.length,
                    itemBuilder: (BuildContext context, int index) {
                      dynamic _data = sampleData[index];
                      return ListTile(
                        title: Text(
                          '${_data['title']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${_data['body']}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }

  ///
  /// render small screen size example
  /// e.g. mobile screen size
  ///
  _renderSmallScreenPagination() {
    TextStyle? _textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.brown,
          fontSize: 14,
        );

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        FlutterCustomPagination(
          currentPage: currentPage,
          limitPerPage: pageLimit,
          totalDataCount: totalDataCount,
          onPreviousPage: _onChangePage,
          onBackToFirstPage: _onChangePage,
          onNextPage: _onChangePage,
          onGoToLastPage: _onChangePage,
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: _textStyle,
          previousPageIcon: Icons.keyboard_arrow_left,
          backToFirstPageIcon: Icons.first_page,
          nextPageIcon: Icons.keyboard_arrow_right,
          goToLastPageIcon: Icons.last_page,
        ),
        FlutterCustomPaginationOptions(
          limitPerPage: pageLimit,
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: _textStyle,
          pageLimitOptions: pageLimitOptions,
          onPageLimitChanged: _onPageLimitChanged,
          text: 'items per page',
        ),
      ],
    );
  }

  ///
  /// render large screen size example
  /// e.g. tablet and desktop screen size
  ///
  _renderLargeScreenPagination() {
    TextStyle? _textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.brown,
          fontSize: 14,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlutterCustomPaginationOptions(
          limitPerPage: pageLimit,
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: _textStyle,
          pageLimitOptions: pageLimitOptions,
          onPageLimitChanged: _onPageLimitChanged,
          text: 'items per page',
        ),
        FlutterCustomPagination(
          currentPage: currentPage,
          limitPerPage: pageLimit,
          totalDataCount: totalDataCount,
          onPreviousPage: _onChangePage,
          onBackToFirstPage: _onChangePage,
          onNextPage: _onChangePage,
          onGoToLastPage: _onChangePage,
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: _textStyle,
          previousPageIcon: Icons.keyboard_arrow_left,
          backToFirstPageIcon: Icons.first_page,
          nextPageIcon: Icons.keyboard_arrow_right,
          goToLastPageIcon: Icons.last_page,
        ),
      ],
    );
  }

  _onPageLimitChanged(int? limit) async {
    setState(() {
      currentPage = 1;
      pageLimit = limit ?? 15;
    });
    await _getSampleData();
  }

  _onChangePage(int page) async {
    setState(() {
      currentPage = page;
    });
    await _getSampleData();
  }

  _getSampleData() async {
    try {
      setState(() {
        sampleData = [];
      });
      final response =
          await dio.get('/posts?_page=$currentPage&_limit=$pageLimit');
      setState(() {
        sampleData = response.data;

        // set total data count here, if necessary
        // the sample api doesn't provide total data count details, so i set it manually to 100
        totalDataCount = 100;
      });
    } catch (e) {
      print(e);
    }
  }
}
