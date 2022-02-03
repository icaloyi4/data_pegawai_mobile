import 'package:clean_architecture_null_safety/core/assets/my_color.dart';
import 'package:flutter/material.dart';

import 'custom_nav_bar_model.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItemCustom>
      items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(
      PersistentBottomNavBarItemCustom item, bool isSelected, int index) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          items.length.isOdd && index == (items.length / 2).round() - 1
              ? Flexible(
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? MyColors.mainColor
                            : MyColors.bottomIconInActiveColor),
                    child: IconTheme(
                      data: IconThemeData(
                          size: 26.0,
                          color: isSelected
                              ? (item.activeColorAlternate == null
                                  ? item.activeColor
                                  : item.activeColorAlternate)
                              : item.inactiveColor == null
                                  ? item.activeColor
                                  : item.inactiveColor),
                      child: item.icon,
                    ),
                  ),
                )
              : Flexible(
                  child: Container(
                    child: IconTheme(
                      data: IconThemeData(
                          size: 26.0,
                          color: isSelected
                              ? (item.activeColorAlternate == null
                                  ? item.activeColor
                                  : item.activeColorAlternate)
                              : item.inactiveColor == null
                                  ? item.activeColor
                                  : item.inactiveColor),
                      child: item.icon,
                    ),
                  ),
                ),
          item.title != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Material(
                    type: MaterialType.transparency,
                    child: FittedBox(
                        child: Text(
                      item.title,
                      style: TextStyle(
                          color: isSelected
                              ? (item.activeColorAlternate == null
                                  ? item.activeColor
                                  : item.activeColorAlternate)
                              : item.inactiveColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0),
                    )),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index, index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
