import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';
import 'package:weather_app/screens/widgets/search_widget.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBar createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar> {
  final GlobalKey<SearchState> _searchStateKey = GlobalKey<SearchState>();
  double opacity;

  @override
  void initState() {
    super.initState();
    opacity = 1.0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);

    return Stack(children: <Widget>[
      Opacity(
        opacity: opacity,
        child: Container(
          alignment: AlignmentDirectional.topStart,
          margin: EdgeInsets.only(top: 35, left: 5, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu),
                color: theme.getTheme().primaryTextColor,
                splashColor:
                    theme.getTheme().secondaryTextColor.withOpacity(0.2),
              ),
              Text(
                'Weather Forecast',
                style: TextStyle(
                  color: theme.getTheme().primaryTextColor,
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('call another method');
                  _searchStateKey.currentState.showSearchBar();
                },
                color: theme.getTheme().primaryTextColor,
                splashColor:
                    theme.getTheme().secondaryTextColor.withOpacity(0.1),
              )
            ],
          ),
        ),
      ),
      Search(
        key: _searchStateKey,
        callBack: (double opacity) {
          setState(() {
            this.opacity = opacity;
          });
        },
      ),
    ]);
  }
}
