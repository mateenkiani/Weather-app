import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';

class Search extends StatefulWidget {
  final MyCallBack callBack;
  Search({Key key, this.callBack}) : super(key: key);
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  FocusNode myFocusNode;
  TextEditingController myController;
  double width;
  bool searchBarVisibility;
  bool locationWidgetVisibility;

  void showSearchBar() {
    print('functin called');
    setState(() {
      searchBarVisibility = true;
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        width = MediaQuery.of(context).size.width - 10;
        widget.callBack(0.0);
      });
    });
  }

  void hideSearchBar() {
    print('functin called');
    setState(() {
      width = 100;
    });
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        searchBarVisibility = false;
        widget.callBack(1.0);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    width = 100;
    searchBarVisibility = false;
    locationWidgetVisibility = false;
    myFocusNode = FocusNode();
    myController = new TextEditingController();
    myFocusNode.addListener(focusChanged);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  void focusChanged() {
    if (myFocusNode.hasFocus) {
      setState(() {
        locationWidgetVisibility = true;
      });
    } else {
      setState(() {
        locationWidgetVisibility = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);

    return Visibility(
      visible: searchBarVisibility,
      child: Positioned(
        top: 35,
        right: 5,
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              curve: Curves.decelerate,
              duration: Duration(milliseconds: 50),
              width: width,
              height: 50,
              decoration: BoxDecoration(
                color: theme.getTheme().primaryColor,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close),
                      splashColor: Colors.red,
                      onPressed: () {
                        resetField();
                        hideSearchBar();
                      },
                      color: theme.getTheme().primaryTextColor,
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            color: theme.getTheme().secondaryTextColor),
                        focusNode: myFocusNode,
                        controller: myController,
                        onEditingComplete: () => editingComplete(),
                        decoration: InputDecoration(
                            fillColor: theme.getTheme().primaryTextColor,
                            hintStyle:
                                TextStyle(color: theme.getTheme().primaryColor),
                            contentPadding:
                                EdgeInsets.only(left: 15, right: 15),
                            hintText: "Search City",
                            filled: true,
                            border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        splashColor: theme
                            .getTheme()
                            .secondaryTextColor
                            .withOpacity(0.2),
                        color: theme.getTheme().primaryTextColor,
                        onPressed: () => editingComplete(),
                        icon: Icon(Icons.location_on)),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: locationWidgetVisibility,
              child: Container(
                height: 50,
                margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                color: theme.getTheme().secondaryColor,
                width: MediaQuery.of(context).size.width - 105,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_searching,
                      color: theme.getTheme().secondaryTextColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Use Current Location',
                        style: TextStyle(
                          color: theme.getTheme().secondaryTextColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void editingComplete() {
    myController.clear();
    FocusScope.of(context).unfocus();
  }

  void resetField() {
    myController.clear();
    FocusScope.of(context).unfocus();
  }
}

typedef MyCallBack = void Function(double);
