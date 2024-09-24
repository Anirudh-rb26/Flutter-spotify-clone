import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/helpers/is_darkmode.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const Appbar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // Appbar Backbutton
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.isDarkMode ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
          child: Icon(
            CupertinoIcons.back,
            size: 15,
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),

      // Appbar Logo
      centerTitle: true,
      title: title ?? const Text(""),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
