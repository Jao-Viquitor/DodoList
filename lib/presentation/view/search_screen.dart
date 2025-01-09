import 'package:dodo/core/theme/colors.dart';
import 'package:dodo/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:dodo/presentation/viewmodel/task_viewmodel.dart';
import 'package:dodo/presentation/widgets/task/task_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    Future.microtask(() => context.read<TaskViewModel>().fetchTasks());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _searchTasks(BuildContext context, String query) {
    if (query.isEmpty) {
      context.read<TaskViewModel>().clearSearchResults();
    } else {
      context.read<TaskViewModel>().searchTasks(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskViewModel = context.watch<TaskViewModel>();
    final searchResults = _searchController.text.isEmpty
        ? taskViewModel.tasks
        : taskViewModel.searchResults;
    final isLoading = taskViewModel.isSearching;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              style: TextStyles.subtitleH2,
              decoration: InputDecoration(
                hintText: 'Search Task',
                hintStyle: TextStyles.subtitleH2.copyWith(color: AppColors.slateBlue),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 8),
                  child: SvgPicture.asset(
                    'assets/icons/ic_search.svg',
                    color: _isFocused ? AppColors.accent : AppColors.slateBlue,
                    width: 16,
                    height: 16,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.accent,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.paleWhite,
                    width: 1.0,
                  ),
                ),
                filled: true,
                fillColor: AppColors.paleWhite,
                suffixIcon: IconButton(
                  icon: SvgPicture.asset('assets/icons/ic_closes.svg'),
                  onPressed: () {
                    _searchController.clear();
                    _searchTasks(context, '');
                  },
                ),
              ),
              onChanged: (query) => _searchTasks(context, query),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : searchResults.isEmpty
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
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final task = searchResults[index];
                final originalIndex =
                taskViewModel.tasks.indexOf(task);

                return TaskItem(
                  title: task.title,
                  description: task.description,
                  isCompleted: task.isCompleted,
                  showDescription: false,
                  onChanged: (value) {
                    context
                        .read<TaskViewModel>()
                        .completeTask(originalIndex, value);
                  },
                  onDelete: task.isCompleted
                      ? () {
                    context
                        .read<TaskViewModel>()
                        .deleteTask(originalIndex);
                  }
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
