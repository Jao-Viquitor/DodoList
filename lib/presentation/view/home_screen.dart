import 'package:dodo/presentation/view/completed_screen.dart';
import 'package:dodo/presentation/view/task_screen.dart';
import 'package:dodo/presentation/widgets/bottomSheets/create_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dodo/presentation/view/search_screen.dart';
import 'package:dodo/presentation/widgets/appbar/app_bar.dart';
import 'package:dodo/presentation/widgets/navbar/navbar.dart';
import 'package:dodo/presentation/viewmodel/task_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TaskViewModel>().fetchTasks());
  }

  void _onNavbarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBarCustom(),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            TaskScreen(),
            CreateTask(),
            SearchScreen(),
            CompletedScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Navbar(
        currentIndex: _currentIndex,
        onTap: _onNavbarTap,
      ),
    );
  }
}
