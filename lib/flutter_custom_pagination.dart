library flutter_custom_pagination;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FlutterCustomPagination extends StatelessWidget {
  const FlutterCustomPagination({
    super.key,
    required this.currentPage,
    required this.limitPerPage,
    required this.totalDataCount,
    required this.onPreviousPage,
    required this.onNextPage,
    this.backgroundColor,
    this.textStyle,
  });

  final int currentPage;
  final int limitPerPage;
  final int totalDataCount;
  final Function(int) onPreviousPage;
  final Function(int) onNextPage;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    int _lastPage = (totalDataCount / limitPerPage).ceil();
    bool _hasPrevPage = currentPage > 1;
    bool _hasNextPage = currentPage < _lastPage;

    if (kDebugMode) {
      print('lastPage: $_lastPage');
      print('hasPrevPage: $_hasPrevPage');
      print('hasNextPage: $_hasNextPage');
    }

    return Container(
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: _hasPrevPage ? () => onPreviousPage(1) : null,
            icon: const Icon(Icons.keyboard_double_arrow_left),
          ),
          IconButton(
            onPressed: _hasPrevPage ? () => onPreviousPage(currentPage - 1) : null,
            icon: const Icon(Icons.keyboard_arrow_left),
          ),
          const SizedBox(width: 10),
          Text(
            'Page $currentPage of $_lastPage',
            style: textStyle,
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: _hasNextPage ? () => onPreviousPage(currentPage + 1) : null,
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
          IconButton(
            onPressed: _hasNextPage ? () => onNextPage(_lastPage) : null,
            icon: const Icon(Icons.keyboard_double_arrow_right),
          ),
        ],
      ),
    );
  }
}
