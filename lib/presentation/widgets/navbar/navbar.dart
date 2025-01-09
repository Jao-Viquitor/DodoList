
import 'package:dodo/presentation/widgets/bottomSheets/create_task.dart';
import 'package:flutter/material.dart';

import 'nav_item.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            svgPath: 'assets/icons/ic_todo.svg',
            label: 'Todo',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          NavItem(
            svgPath: 'assets/icons/ic_plus.svg',
            label: 'Create',
            isSelected: currentIndex == 1,
            onTap: () => CreateTask.show(context),
          ),
          NavItem(
            svgPath: 'assets/icons/ic_search.svg',
            label: 'Search',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          NavItem(
            svgPath: 'assets/icons/ic_checked_nav.svg',
            label: 'Done',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}
