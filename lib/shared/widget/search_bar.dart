import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.tune, color: theme.colorScheme.outline),
            ),
            SizedBox(
              height: 24.h,
              child: VerticalDivider(
                color: theme.colorScheme.outline,
                thickness: 1,
                width: 16.w,
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: _searchFocusNode,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  filled: false,
                  hintText: " ...جستجو در بین هتل ها ",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
            ),
            IconButton(
              onPressed: () => _searchFocusNode.requestFocus(),
              icon: Icon(Icons.search, color: theme.colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}
