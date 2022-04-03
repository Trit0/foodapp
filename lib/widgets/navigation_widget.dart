import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationWidget extends StatefulWidget implements PreferredSizeWidget {
  NavigationWidget(
      {Key? key,
      required this.context,
      this.hidden = 0,
      this.title = "India Masala"})
      : super(key: key);

  final String title;
  final BuildContext context;
  int hidden;

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();

  @override
  Size get preferredSize {
    return Size(MediaQuery.of(context).size.width, 62.0);
  }
}

class MenuOption {
  int value;
  String displayText;
  StatefulWidget? direction;
  IconData icon;
  int hidden;
  Color color;
  Function? onClick;

  MenuOption(this.value, this.displayText, this.icon, this.hidden,
      {this.color = Colors.black, this.direction, this.onClick});
}

class MenuOptions {
  static List<MenuOption> options = [];

  static const int LOGIN = 1;
  static const int REGISTER = 2;
  static const int CART = 4;
  static const int MENU = 8;
  static const int LIST = 16;
  static const int MEAL = 32;
  static const int LOGOUT = 64;
}

class _NavigationWidgetState extends State<NavigationWidget> {
  void navigate(int action) {
    if (MenuOptions.options[action].direction != null) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MenuOptions.options[action].direction!),
        );
      });
    } else if (MenuOptions.options[action].onClick != null) {
      MenuOptions.options[action].onClick!();
      if (MenuOptions.options[action].hidden == MenuOptions.LOGOUT) {
        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MenuOptions.options[3].direction!),
          );
        });
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Option non implémenté')));
    }
  }

  bool isVisible(int option) {
    return option & widget.hidden == 0;
  }

  void verifyConnection() {}

  @override
  Widget build(BuildContext context) {
    verifyConnection();
    return AppBar(
      title: Text(widget.title),
      actions: [
        PopupMenuButton(
            onSelected: navigate,
            itemBuilder: (context) => [
                  for (var option in MenuOptions.options)
                    if (isVisible(option.hidden))
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option.displayText,
                                style: TextStyle(color: option.color)),
                            Icon(
                              option.icon,
                              color: option.color,
                              semanticLabel: option.displayText,
                            ),
                          ],
                        ),
                        value: option.value,
                      ),
                ])
      ],
    );
  }
}
