# Flutter Custom Pagination

[![pub package](https://img.shields.io/pub/v/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination)
[![likes](https://img.shields.io/pub/likes/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination/score)
[![popularity](https://img.shields.io/pub/popularity/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination/score)
[![pub points](https://img.shields.io/pub/points/flutter_custom_pagination)](https://pub.dev/packages/flutter_custom_pagination/score)

A simple package to help you paginate your data, in web and mobile. This custom pagination is created due to inflexibility of the Flutter's paginated data table.

* **FlutterCustomPagination** 
* **FlutterCustomPaginationOptions**. 

**FlutterCustomPagination** is the main widget that will be used to display the pagination. <br>
**FlutterCustomPaginationOptions** is the widget that will be used to display the page limit options. FlutterCustomPaginationOptions is seperated out to enable more flexibility in displaying the different layouts in different screen sizes.

Current look and feel are based on Material Design. Feel to contribute to this package to enhance the look and feel of the pagination.
<br><br>

## Screenshots

![screenshot-smallscreen](https://github.com/kimmanwky/flutter_custom_pagination/blob/master/screenshot_1.png?raw=true)
![screenshot-bigscreen](https://github.com/kimmanwky/flutter_custom_pagination/blob/master/screenshot_2.png?raw=true)

## Getting Started

Add this plugin:

```yaml
dependencies:
  flutter_custom_pagination: ^0.2.0
```

## Usage

```dart
import 'package:flutter_custom_pagination/flutter_custom_pagination.dart';
import 'package:flutter_custom_pagination/flutter_custom_pagination_options.dart';

class MyWidget extends StatelessWidget {
  int currentPage = 1;
  int pageLimit = 10;
  List<int> pageLimitOptions = [10, 25, 50];
  int totalDataCount = 100;

  @override
  Widget build(BuildContext context) {
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
          limitPerPage: currentPageLimit,
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: _textStyle,
          pageLimitOptions: pageLimitOptions,
          onPageLimitChanged: _onPageLimitChanged,
        ),
      ],
    );
}
```

<br>

## Parameters

### FlutterCustomPagination

| Name                 | Type          | Description                                                             |
| -------------------- | ------------- | ----------------------------------------------------------------------- |
| currentPage*         | int           | The current page number                                                 |
| limitPerPage*        | int           | The limit of data per page                                              |
| totalDataCount*      | int           | The total data count                                                    |
| onPreviousPage*      | Function(int) | The function to be called when the previous page button is pressed      |
| onBackToFirstPage    | Function(int) | The function to be called when the back to first page button is pressed |
| onNextPage*          | Function(int) | The function to be called when the next page button is pressed          |
| onGoToLastPage       | Function(int) | The function to be called when the go to last page button is pressed    |
| backgroundColor      | Color         | The background color of the pagination                                  |
| textStyle            | TextStyle     | The text style of the pagination                                        |
| previousPageIcon     | IconData      | The icon of the previous page button                                    |
| backToFirstPageIcon  | IconData      | The icon of the back to first page button                               |
| nextPageIcon         | IconData      | The icon of the next page button                                        |
| goToLastPageIcon     | IconData      | The icon of the go to last page button                                  |

<br>

### FlutterCustomPaginationOptions

| Name                 | Type          | Description                                                             |
| -------------------- | ------------- | ----------------------------------------------------------------------- |
| limitPerPage*        | int           | The limit of data per page                                              |
| pageLimitOptions*    | List<int>     | The page limit options                                                  |
| onPageLimitChanged*  | Function(int) | The function to be called when the page limit is changed                |
| backgroundColor      | Color         | The background color of the pagination                                  |
| textStyle            | TextStyle     | The text style of the pagination                                        |
| text                 | String        | The text to be displayed after the page limit options                   |
| isDense              | bool          | Whether the dropdown button is dense or not                             |