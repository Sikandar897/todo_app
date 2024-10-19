import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_view_model.dart';
import '../widgets/task_list_item.dart';
import 'add_edit_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  FocusNode searchFocusNode =
      FocusNode(); // FocusNode to control keyboard focus

  @override
  void dispose() {
    searchFocusNode.dispose(); // Always dispose the focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To Do List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              focusNode: searchFocusNode, // Attach the FocusNode
              keyboardType: TextInputType.text, // Set keyboard type to text
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              onTap: () {
                searchFocusNode
                    .requestFocus(); // Ensure focus is set only on tap
              },
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          searchFocusNode
              .unfocus(); // Dismiss the keyboard if user taps outside
        },
        child: Consumer<TodoViewModel>(
          builder: (context, viewModel, child) {
            final filteredTasks = viewModel.todos
                .where((todo) => todo.title
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
                .toList()
              ..sort((a, b) => a.isCompleted ? 1 : -1);

            return ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final todo = filteredTasks[index];
                return TaskListItem(todo: todo, index: index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditTodoScreen(),
            ),
          );
        },
      ),
    );
  }
}
