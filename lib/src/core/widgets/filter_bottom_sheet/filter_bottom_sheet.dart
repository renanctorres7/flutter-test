import 'package:base_project/src/core/core.dart';
import 'package:base_project/src/core/localization/language.dart';
import 'package:base_project/src/core/theme/app_theme.dart';
import 'package:base_project/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final Map<String, bool> filterMap;
  final List<String> defaultList;
  final Function(Map<String, bool>) onFilterChanged;
  const FilterBottomSheet({
    super.key,
    required this.filterMap,
    required this.onFilterChanged,
    required this.defaultList,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Map<String, bool> _filterMap = {};
  final List<String> _selectedList = [];

  _initSelectedList() {
    for (var key in _filterMap.keys) {
      if (_filterMap[key] == true) {
        _selectedList.add(key);
      }
    }
  }

  bool _isDefault(String key) {
    bool isDefault = false;
    for (var item in widget.defaultList) {
      if (item == key) {
        isDefault = true;
        break;
      }
    }
    return isDefault;
  }

  @override
  void initState() {
    super.initState();
    _filterMap = widget.filterMap;
    _initSelectedList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.of.cardBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        width: context.screenSize.width,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppTheme.of.dividerColor, width: 1),
                ),
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: appTextDefault(
                      Language.of.additionalInformation,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.of.textCardTitleColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            for (var key in _filterMap.keys)
              Row(
                spacing: 8,
                children: [
                  Checkbox(
                    value: _filterMap[key],
                    checkColor: AppTheme.of.textWhiteColor,
                    fillColor: WidgetStateProperty<Color>.fromMap(
                      <WidgetStatesConstraint, Color>{
                        WidgetState.selected:
                            _isDefault(key)
                                ? AppTheme.of.checkBoxDefaultColor
                                : AppTheme.of.checkBoxSelectedColor,
                        WidgetState.any: AppTheme.of.cardBackgroundColor,
                      },
                    ),

                    onChanged: (value) {
                      setState(() {
                        if (value != null && !_isDefault(key)) {
                          _filterMap[key] = value;
                        }
                      });
                      widget.onFilterChanged(_filterMap);
                    },
                  ),
                  appTextDefault(
                    key,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.of.textCardTitleColor,
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Divider(color: AppTheme.of.dividerColor, height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
