import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';
import './widgets/app_bar.dart';
import 'widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          MyAppBar(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.cloud,
                  color: theme.getTheme().primaryTextColor,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Today',
                        style: TextStyle(
                            fontFamily: 'SofiaProLight',
                            fontWeight: FontWeight.w300,
                            color: theme.getTheme().primaryTextColor,
                            fontSize: 40),
                      ),
                    ),
                    Text(
                      'Sat, 3 Aug',
                      style: TextStyle(
                          fontFamily: 'SofiaProLight',
                          color: theme.getTheme().primaryTextColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '28',
                  style: TextStyle(
                      color: theme.getTheme().primaryTextColor,
                      fontFamily: 'SofiaProExtraLight',
                      fontWeight: FontWeight.w300,
                      fontSize: 100),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'o',
                    style: TextStyle(
                        fontFamily: 'SofiaProLight',
                        color: theme.getTheme().primaryTextColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'C',
                    style: TextStyle(
                        fontFamily: 'SofiaProLight',
                        color: theme.getTheme().primaryTextColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Barcelona' + ', ',
                  style: TextStyle(color: theme.getTheme().primaryTextColor),
                ),
                Text(
                  'Spain',
                  style: TextStyle(color: theme.getTheme().primaryTextColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.colorize,
                    color: theme.getTheme().primaryTextColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Today',
                      style:
                          TextStyle(color: theme.getTheme().primaryTextColor),
                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 15,
                      color: theme.getTheme().primaryTextColor,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Tommorrow',
                      style:
                          TextStyle(color: theme.getTheme().primaryTextColor),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Next 7 Days',
                      style:
                          TextStyle(color: Colors.blueAccent),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.blueAccent,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
      backgroundColor: theme.getTheme().primaryColor,
      drawer: myDrawer(context),
    );
  }
}
