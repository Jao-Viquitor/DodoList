
import 'package:dodo/core/theme/colors.dart';
import 'package:dodo/core/theme/text_styles.dart';
import 'package:dodo/presentation/widgets/bottomSheets/create_task.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty.png', height: 80),
          const SizedBox(height: 24),
          Text(
            'You have no task listed.',
            style: TextStyles.subtitleH2.copyWith(color: AppColors.slateBlue),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => CreateTask.show(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[50],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: AppColors.accent),
                const SizedBox(width: 8),
                Text(
                  'Create task',
                  style: TextStyles.subtitleH1.copyWith(color: AppColors.accent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
