import 'package:flutter/material.dart';
import 'package:dodo/core/theme/colors.dart';
import 'package:dodo/core/theme/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final bool showDescription;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onToggleDescription;

  const TaskItem({
    super.key,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.showDescription = false,
    required this.onChanged,
    this.onDelete,
    this.onToggleDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.paleWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onChanged(!isCompleted),
              child: SvgPicture.asset(
                isCompleted
                    ? 'assets/icons/ic_checked.svg'
                    : 'assets/icons/ic_unchecked.svg',
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onToggleDescription,
                    child: Text(
                      title,
                      style: TextStyles.subtitleH2.copyWith(
                        color: isCompleted
                            ? AppColors.slateBlue
                            : AppColors.slatePurple,
                      ),
                    ),
                  ),
                  if (showDescription) ...[
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyles.paragraph.copyWith(
                        color: AppColors.slateBlue,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (isCompleted)
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/ic_garbage.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: onDelete,
              ),
          ],
        ),
      ),
    );
  }
}
