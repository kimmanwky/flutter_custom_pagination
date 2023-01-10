library flutter_custom_pagination;

import 'package:flutter/material.dart';

class FlutterCustomPaginationOptions extends StatelessWidget {
  const FlutterCustomPaginationOptions({
    super.key,
    required this.limitPerPage,
    required this.pageLimitOptions,
    required this.onPageLimitChanged,
    this.backgroundColor,
    this.textStyle,
    this.text = 'items per page',
    this.isDense = false,
  });

  ///
  /// The limit per page.
  /// <br><br>
  /// Must be greater than 0.<br>
  /// Must be included in the "pageLimitOptions" listing if "showPageLimitOptions" is true.<br>
  ///
  final int limitPerPage;

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

  ///
  /// The background color of the pagination options widget.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the background color will be transparent.<br>
  ///
  final Color? backgroundColor;

  ///
  /// The text style of the pagination options widget.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the text style will be the default text style.<br>
  ///
  final TextStyle? textStyle;

  ///
  /// The text of the pagination options widget.
  /// <br><br>
  /// This parameter is optional.<br>
  /// If this parameter is empty, the default text will be used.<br>
  ///
  final String text;

  ///
  /// The dense of the pagination options widget.
  /// <br><br>
  /// This parameter is optional.<br>
  ///
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    double _fontSize = textStyle?.fontSize ?? 14;
    double _containerSize = _fontSize * 3;

    return Container(
      height: _containerSize,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: 60,
            child: DropdownButton<int>(
              value: limitPerPage,
              style: textStyle,
              isExpanded: true,
              items: pageLimitOptions
                  .map(
                    (int item) => DropdownMenuItem<int>(
                        value: item, child: Text('$item', style: textStyle)),
                  )
                  .toList(),
              onChanged: onPageLimitChanged != null
                  ? (int? pageLimit) => onPageLimitChanged!(pageLimit)
                  : null,
              selectedItemBuilder: (context) => pageLimitOptions
                  .map(
                    (int item) =>
                        Center(child: Text('$item', style: textStyle)),
                  )
                  .toList(),
              isDense: isDense,
            ),
          ),
          const SizedBox(width: 5),
          Text('items per page', style: textStyle),
        ],
      ),
    );
  }
}
