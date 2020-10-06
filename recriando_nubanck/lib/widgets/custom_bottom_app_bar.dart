import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize

  final bool isExpaned;
  final void Function() onTap;

  const CustomBottomAppBar({this.isExpaned, this.onTap} );

  Size get preferredSize => Size.fromHeight(20);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Icon(
      isExpaned ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
      color: Colors.white,
      size: 24,
    ),
      onTap: onTap,
    );
  }
}
