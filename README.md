# Flutter Custom Pagination

[![pub package](https://img.shields.io/pub/v/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination)
[![likes](https://img.shields.io/pub/likes/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination/score)
[![popularity](https://img.shields.io/pub/popularity/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination/score)
[![pub points](https://img.shields.io/pub/points/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination/score)

A simple package to help you paginate your data, in web and mobile. This custom pagination is created due to inflexibility of the Flutter's paginated data table.

Feel to contribute to this package to enhance the look and feel of the pagination.
<br><br>

## Screenshot image

![screenshot](https://github.com/kimmanwky/flutter_custom_pagination/blob/master/Screenshot_1.png?raw=true&width=300)

## Getting Started

Add this plugin:

```yaml
dependencies:
  flutter_custom_pagination: ^0.1.0
```

## Usage

```dart
import 'package:flutter_custom_pagination/flutter_custom_pagination.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterCustomPagination(
      currentPage: currentPage,
      limitPerPage: currentPageLimit,
      totalDataCount: totalDataCount,
      onPreviousPage: _onChangePage,
      onBackToFirstPage: _onChangePage,
      onNextPage: _onChangePage,
      onGoToLastPage: _onChangePage,
      backgroundColor: Theme.of(context).colorScheme.background,
      textStyle: Theme.of(context).textTheme.labelMedium,
      showPageLimitOptions: true,
      pageLimitOptions: pageLimitOptions,
      onPageLimitChanged: _onPageLimitChanged,
      previousPageIcon: Icons.keyboard_arrow_left,
      backToFirstPageIcon: Icons.first_page,
      nextPageIcon: Icons.keyboard_arrow_right,
      goToLastPageIcon: Icons.last_page,
    ),
  );
}
```

## Parameters

| Name                 | Type          | Description                                                             |
| -------------------- | ------------- | ----------------------------------------------------------------------- |
| currentPage          | int           | The current page number                                                 |
| limitPerPage         | int           | The limit of data per page                                              |
| totalDataCount       | int           | The total data count                                                    |
| onPreviousPage       | Function(int) | The function to be called when the previous page button is pressed      |
| onBackToFirstPage    | Function(int) | The function to be called when the back to first page button is pressed |
| onNextPage           | Function(int) | The function to be called when the next page button is pressed          |
| onGoToLastPage       | Function(int) | The function to be called when the go to last page button is pressed    |
| backgroundColor      | Color         | The background color of the pagination                                  |
| textStyle            | TextStyle     | The text style of the pagination                                        |
| showPageLimitOptions | bool          | Whether to show the page limit options                                  |
| pageLimitOptions     | List<int>     | The page limit options                                                  |
| onPageLimitChanged   | Function(int) | The function to be called when the page limit is changed                |
| previousPageIcon     | IconData      | The icon of the previous page button                                    |
| backToFirstPageIcon  | IconData      | The icon of the back to first page button                               |
| nextPageIcon         | IconData      | The icon of the next page button                                        |
| goToLastPageIcon     | IconData      | The icon of the go to last page button                                  |
