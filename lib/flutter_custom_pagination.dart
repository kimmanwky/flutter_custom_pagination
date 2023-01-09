library flutter_custom_pagination;

import 'package:flutter/material.dart';

class FlutterCustomPagination extends StatelessWidget {
  const FlutterCustomPagination({
    super.key,
    required this.currentPage,
    required this.limitPerPage,
    required this.totalDataCount,
    required this.onPreviousPage,
    this.onBackToFirstPage,
    required this.onNextPage,
    this.onGoToLastPage,
    this.backgroundColor,
    this.textStyle,
    this.showPageLimitOptions = false,
    this.pageLimitOptions = const [10, 20, 50],
    this.onPageLimitChanged,
  })  : assert(showPageLimitOptions == true && onPageLimitChanged != null,
            'onPageLimitChanged must not be empty if showPageLimitOptions is true'),
        assert(currentPage > 0, 'currentPage must be greater than 0'),
        assert(limitPerPage > 0, 'limitPerPage must be greater than 0'),
        assert(totalDataCount >= 0, 'totalDataCount must be greater than or equal to 0');

  ///
  /// The current page number.
  /// <br><br>
  /// Must be greater than 0.<br>
  /// Must be less than or equal to the last page number.<br>
  /// The last page number is calculated by dividing the total data count by the limit per page.
  /// The last page number is rounded up to the nearest integer.<br>
  /// <br>For example, <br>if the total data count is 100 and the limit per page is 10,
  /// then the last page number is 10.<br>
  /// If the total data count is 101 and the limit per page is 10,
  /// then the last page number is 11.<br>
  /// If the total data count is 0 and the limit per page is 10,
  /// then the last page number is 1.<br>
  ///
  final int currentPage;

  ///
  /// The limit per page.
  /// <br><br>
  /// Must be greater than 0.<br>
  /// Must be included in the "pageLimitOptions" listing if "showPageLimitOptions" is true.<br>
  ///
  final int limitPerPage;

  ///
  /// The total data count.
  /// <br><br>
  /// Must be greater than or equal to 0.<br>
  ///
  final int totalDataCount;

  ///
  /// The callback function when the previous page button is pressed.
  /// <br><br>
  /// The parameter is <int> the page number.<br>
  ///
  final Function(int) onPreviousPage;

  ///
  /// The callback function when the back to first page button is pressed.
  /// <br><br>
  /// The parameter is <int> the page number.<br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, onPreviousPage function will be triggered.<br>
  final Function(int)? onBackToFirstPage;

  ///
  /// The callback function when the next page button is pressed.
  /// <br><br>
  /// The parameter is <int> the page number.<br>
  ///
  final Function(int) onNextPage;

  ///
  /// The callback function when the go to last page button is pressed.
  /// <br><br>
  /// The parameter is <int> the page number.<br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, onNextPage function will be triggered.<br>
  ///
  final Function(int)? onGoToLastPage;

  ///
  /// The background color of the pagination widget.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the background color will be transparent.<br>
  ///
  final Color? backgroundColor;

  ///
  /// The text style of the pagination widget.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the text style will be the default text style.<br>
  ///
  final TextStyle? textStyle;

  ///
  /// The flag to show the page limit options.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the page limit options will not be shown.<br>
  ///
  final bool? showPageLimitOptions;

  ///
  /// The page limit options.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the default page limit options will be used.<br>
  ///
  final List<int> pageLimitOptions;

  ///
  /// The callback function when the page limit option is changed.
  /// <br><br>
  /// The parameter is <int?> the page limit.<br>
  /// This parameter is optional.<br>
  /// This parameter must exist if "showPageLimitOptions" is true.<br>
  ///
  final Function(int?)? onPageLimitChanged;

  @override
  Widget build(BuildContext context) {
    assert(showPageLimitOptions == true && pageLimitOptions.contains(limitPerPage),
        'value "limitPerPage" must be included in "pageLimitOptions" listing');

    double _fontSize = textStyle?.fontSize ?? 14;
    double _iconRatio = 1.2;
    double _iconSize = _fontSize * _iconRatio;
    int _lastPage = (totalDataCount / limitPerPage).ceil() <= 0 ? 1 : (totalDataCount / limitPerPage).ceil();
    assert(currentPage <= _lastPage, 'currentPage must be less than or equal to the last page number');

    bool _hasPrevPage = currentPage > 1;
    bool _hasNextPage = currentPage < _lastPage;

    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tooltip(
              message: 'Back to first page',
              child: IconButton(
                onPressed:
                    _hasPrevPage ? () => (onBackToFirstPage != null ? onBackToFirstPage!(1) : onPreviousPage(1)) : null,
                iconSize: _iconSize,
                splashRadius: _iconSize + 4,
                icon: Icon(
                  Icons.keyboard_double_arrow_left,
                  color: _hasPrevPage ? textStyle?.color : textStyle?.color?.withOpacity(0.5),
                  size: _iconSize,
                ),
              ),
            ),
            Tooltip(
              message: 'Previous page',
              child: IconButton(
                onPressed: _hasPrevPage ? () => onPreviousPage(currentPage - 1) : null,
                iconSize: _iconSize,
                splashRadius: _iconSize + 4,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: _hasPrevPage ? textStyle?.color : textStyle?.color?.withOpacity(0.5),
                  size: _iconSize,
                ),
              ),
            ),
            SizedBox(width: textStyle?.fontSize ?? 14),
            Text(
              'Page $currentPage of $_lastPage',
              style: textStyle,
            ),
            SizedBox(width: textStyle?.fontSize ?? 14),
            Tooltip(
              message: 'Next page',
              child: IconButton(
                onPressed: _hasNextPage ? () => onPreviousPage(currentPage + 1) : null,
                iconSize: _iconSize,
                splashRadius: _iconSize + 4,
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  color: _hasNextPage ? textStyle?.color : textStyle?.color?.withOpacity(0.5),
                  size: _iconSize,
                ),
              ),
            ),
            Tooltip(
              message: 'Go to last page',
              child: IconButton(
                onPressed: _hasNextPage
                    ? () => (onGoToLastPage != null ? onGoToLastPage!(_lastPage) : onNextPage(_lastPage))
                    : null,
                iconSize: _iconSize,
                splashRadius: _iconSize + 4,
                icon: Icon(
                  Icons.keyboard_double_arrow_right,
                  color: _hasNextPage ? textStyle?.color : textStyle?.color?.withOpacity(0.5),
                  size: _iconSize,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: (textStyle?.fontSize ?? 14) * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: textStyle?.fontSize ?? 14),
            if (showPageLimitOptions == true)
              SizedBox(
                width: 60,
                child: DropdownButton<int>(
                  value: limitPerPage,
                  style: textStyle,
                  isExpanded: true,
                  items: pageLimitOptions
                      .map(
                        (int item) => DropdownMenuItem<int>(value: item, child: Text('$item')),
                      )
                      .toList(),
                  onChanged: onPageLimitChanged != null ? (int? pageLimit) => onPageLimitChanged!(pageLimit) : null,
                  selectedItemBuilder: (context) => pageLimitOptions
                      .map(
                        (int item) => Center(child: Text('$item')),
                      )
                      .toList(),
                ),
              ),
            const SizedBox(width: 5),
            Text('items per page', style: textStyle),
          ],
        ),
      ],
    );
  }
}
