import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theming/theme_manager.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  FocusNode myFocusNode;
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myController = new TextEditingController();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeNotifier>(context);

    return Container(
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            spreadRadius: 1.0,
            color: theme.getTheme().materialTheme.primaryColor,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: theme.getTheme().materialTheme.buttonColor,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(Icons.menu)),
          Expanded(
            child: TextField(
              focusNode: myFocusNode,
              controller: myController,
              onEditingComplete: () =>
                  editingComplete(context, myFocusNode, myController),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, right: 15),
                  hintText: "Search City",
                  filled: false,
                  border: InputBorder.none),
            ),
          ),
          InkWell(
              onTap: () => editingComplete(context, myFocusNode, myController),
              child: Icon(Icons.search)),
        ],
      ),
    );
  }

  void editingComplete(
      BuildContext context, FocusNode node, TextEditingController controller) {
    controller.clear();
    FocusScope.of(context).unfocus();
  }
}
