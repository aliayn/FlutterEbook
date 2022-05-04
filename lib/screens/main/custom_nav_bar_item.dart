import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem>
      items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;

  // ignore: use_key_in_widget_constructors
  const CustomNavBarWidget(this.selectedIndex, this.items, this.onItemSelected);

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) =>
      Container(
        alignment: Alignment.center,
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: IconTheme(
                  data: IconThemeData(
                      size: 26.0,
                      color: isSelected
                          ? (item.activeColorSecondary ??
                              item.activeColorPrimary)
                          : item.inactiveColorPrimary ??
                              item.activeColorPrimary),
                  child: item.icon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Material(
                  type: MaterialType.transparency,
                  child: FittedBox(
                      child: Text(
                    item.title ?? '',
                    style: TextStyle(
                        color: isSelected
                            ? (item.activeColorSecondary ??
                                item.activeColorPrimary)
                            : item.inactiveColorPrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  )),
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 30,
              offset: const Offset(0.0, -15.0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      );
}
