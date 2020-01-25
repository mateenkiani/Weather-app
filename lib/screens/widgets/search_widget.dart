import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  FocusNode _myFocusNode;
  TextEditingController _myController;
  double _width;
  bool _isVisible;

  void showSearchBar() {
    print('functin called');
    setState(() {
      _isVisible = true;
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _width = MediaQuery.of(context).size.width - 10;
      });
    });
  }

  void hideSearchBar() {
    print('functin called');
    setState(() {
      _width = 100;
    });
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _width = 100;
    _isVisible = false;
    _myFocusNode = FocusNode();
    _myController = new TextEditingController();
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);

    return Visibility(
      visible: _isVisible,
      child: Positioned(
        top: 35,
        right: 5,
        child: AnimatedContainer(
          curve: Curves.decelerate,
          duration: Duration(milliseconds: 50),
          width: _width,
          height: 50,
          decoration: BoxDecoration(
            color: theme.getTheme().primaryColor,
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    color: theme.getTheme().primaryTextColor,
                    onPressed: () {
                      hideSearchBar();
                    },
                    icon: Icon(Icons.close)),
                Expanded(
                  child: TextField(
                    focusNode: _myFocusNode,
                    controller: _myController,
                    onEditingComplete: () =>
                        editingComplete(context, _myFocusNode, _myController),
                    decoration: InputDecoration(
                        fillColor: theme.getTheme().primaryTextColor,
                        hintStyle:
                            TextStyle(color: theme.getTheme().primaryColor),
                        contentPadding: EdgeInsets.only(left: 15, right: 15),
                        hintText: "Search City",
                        filled: true,
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                    color: theme.getTheme().primaryTextColor,
                    onPressed: () =>
                        editingComplete(context, _myFocusNode, _myController),
                    icon: Icon(Icons.location_on)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editingComplete(
      BuildContext context, FocusNode node, TextEditingController controller) {
    controller.clear();
    FocusScope.of(context).unfocus();
  }
}
