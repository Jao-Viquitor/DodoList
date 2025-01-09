import 'package:dodo/core/theme/colors.dart';
import 'package:dodo/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class NavItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.svgPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.accent : AppColors.mutedAzure,
                BlendMode.srcIn,
              ),
            ),
            Text(
              label,
              style: TextStyles.subtitleH3.copyWith(
                color: isSelected ? AppColors.accent : AppColors.mutedAzure,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
