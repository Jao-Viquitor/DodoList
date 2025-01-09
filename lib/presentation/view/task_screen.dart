import 'package:dodo/core/theme/colors.dart';
import 'package:dodo/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dodo/presentation/widgets/task/task_item.dart';
import 'package:dodo/presentation/viewmodel/task_viewmodel.dart';
import 'package:dodo/presentation/view/empty_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskViewModel>(
      builder: (context, taskViewModel, child) {
        final openTasks = taskViewModel.tasks.where((task) => !task.isCompleted).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(26, 6, 26, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Welcome, ',
                      style: TextStyles.title.copyWith(
                        color: AppColors.slatePurple
                      ),
                      children: [
                        TextSpan(
                          text: 'John.',
                          style: TextStyles.title.copyWith(
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                      openTasks.isEmpty
                          ? 'Create tasks to achieve more.'
                          : 'You\'ve got ${openTasks.length} ${openTasks.length == 1 ? 'task' : 'tasks'} to do.',
                      style: TextStyles.subtitleH2.copyWith(
                        color: AppColors.slateBlue
                      )
                  )
                ],
              ),
            ),
            Expanded(
              child: openTasks.isEmpty
                  ? const EmptyScreen()
                  : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: openTasks.length,
                itemBuilder: (context, index) {
                  final task = openTasks[index];
                  final originalIndex = taskViewModel.tasks.indexOf(task);

                  return TaskItem(
                    title: task.title,
                    description: task.description,
                    isCompleted: task.isCompleted,
                    showDescription: index == 0,
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


