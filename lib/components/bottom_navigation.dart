import 'package:auto_route/auto_route.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:flutter/material.dart';

class FiTrackBottomAppBarItem {
  FiTrackBottomAppBarItem(
      {@required this.iconData, @required this.text, @required this.route});
  IconData iconData;
  String text;
  String route;
}

class FiTrackBottomAppBar extends StatelessWidget {
  final double iconSize = 20;
  final double height = 60;

  final List<FiTrackBottomAppBarItem> tabs = [
    FiTrackBottomAppBarItem(
        iconData: Icons.settings,
        text: "Settings",
        route: Routes.settingsScreen),
    FiTrackBottomAppBarItem(
        iconData: Icons.home, text: "Home", route: Routes.homeScreen),
    FiTrackBottomAppBarItem(
        iconData: Icons.history, text: "Log", route: Routes.pastWorkoutsScreen),
  ];

  void _pressedTabItem(BuildContext context, int index) {
    final clickedRoute = tabs[index].route;
    final currentRoute = ModalRoute.of(context).settings.name;
    if (clickedRoute != currentRoute) {
      if (clickedRoute != Routes.settingsScreen) {
        ExtendedNavigator.of(context).pushNamed(clickedRoute);
      } else {
        ExtendedNavigator.of(context).pushNamed(clickedRoute);
      }
    }
  }

  bool _isCurrentRoute(BuildContext context, int index) {
    final clickedRoute = tabs[index].route;
    final currentRoute = ModalRoute.of(context).settings.name;
    return clickedRoute == currentRoute;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(tabs.length, (int index) {
      return _buildTabItem(
          item: tabs[index],
          index: index,
          onPressed: (index) => _pressedTabItem(context, index),
          context: context);
    });
    items.insert(items.length, _buildEmptyTabItem());

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      notchMargin: 10,
      elevation: 4.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    FiTrackBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
    BuildContext context,
  }) {
    final Color color = _isCurrentRoute(context, index)
        ? Theme.of(context).accentColor
        : Colors.white;

    return Expanded(
      child: SizedBox(
        height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyTabItem() {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: iconSize),
          ],
        ),
      ),
    );
  }
}
