import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widget/todo_item.dart';
import '../models/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  String _textFieldValue = "";
  void _showTextField() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Colors.grey,
            title: const Text('Add Task ToDo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _textFieldValue = value;
                    });
                  },
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: tdBlue,
                      ),
                    ),
                    onPressed: () {
                      if (_textFieldValue.isNotEmpty) {
                        _addToDoItem(_textFieldValue);
                      }
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: tdBlue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBAr(),
      body: Stack(children: [
        Container(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              SearchBox(),
              Flexible(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        'All ToDos',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    for (ToDo todoo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todoo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTextField();
        },
        backgroundColor: tdBlue,
        elevation: 12.0,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

// ignore: non_constant_identifier_names
  Widget SearchBox() {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: tdBlack,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 20,
              minWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
          ),
        ));
  }
}

AppBar _buildAppBAr() {
  return AppBar(
    backgroundColor: tdBGColor,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Icon(
        Icons.menu,
        color: tdBlack,
        size: 30,
      ),
      SizedBox(
        height: 40,
        width: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/woman.png'),
        ),
      )
    ]),
  );
}
