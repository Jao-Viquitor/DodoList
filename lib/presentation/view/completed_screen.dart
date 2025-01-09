import 'package:dodo/core/theme/colors.dart';
import 'package:dodo/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dodo/presentation/widgets/task/task_item.dart';
import 'package:dodo/presentation/viewmodel/task_viewmodel.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, taskViewModel, child) {
        final completedTasks = taskViewModel.tasks.where((task) => task.isCompleted).toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 6, 26, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Completed Tasks',
                      style: TextStyles.title
                  ),
                  if (completedTasks.isNotEmpty)
                    TextButton(
                      onPressed: () => taskViewModel.clearTasks(),
                      child: Text(
                        'Delete all',
                        style: TextStyles.title.copyWith(
                          color: AppColors.fireRed,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Expanded(
              child: completedTasks.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty.png', height: 80),
                    const SizedBox(height: 24),
                    Text(
                      'You have no task listed.',
                      style: TextStyles.subtitleH2
                          .copyWith(color: AppColors.slateBlue),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: completedTasks.length,
                itemBuilder: (context, index) {
                  final task = completedTasks[index];
                  final originalIndex = taskViewModel.tasks.indexOf(task);

                  return TaskItem(
                    title: task.title,
                    description: task.description,
                    isCompleted: task.isCompleted,
                    showDescription: false,
                    onChanged: (value) {
                      context.read<TaskViewModel>().completeTask(originalIndex, value);
                    },
                    onDelete: () {
                      context.read<TaskViewModel>().deleteTask(originalIndex);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
