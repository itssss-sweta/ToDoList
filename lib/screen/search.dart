// import 'package:flutter/material.dart';
// import '../constants/colors.dart';
// import '../models/todo.dart';
// import '../widget/todo_item.dart';

// class SearchBox extends StatefulWidget {
//   //final List<ToDo> todosList;
//   const SearchBox({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SearchBox> createState() => _SearchBoxState();
// }

// class _SearchBoxState extends State<SearchBox> {
//   List<ToDo> todosList = ToDo.todoList();
//   List<ToDo> _foundToDo = [];
//   //final _todoController = TextEditingController();
//   @override
//   void initState() {
//     _foundToDo = todosList;
//     super.initState();
//   }

//   void _runFilter(String enteredKeyword) {
//     List<ToDo> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = todosList;
//     } else {
//       results = todosList
//           .where((item) => item.todoText!
//               .toLowerCase()
//               .contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }

//     setState(() {
//       _foundToDo = results;
//     });
//   }

//   void _handleToDoChange(ToDo todo) {
//     setState(() {
//       todo.isDone = !todo.isDone;
//     });
//   }

//   void _deleteToDoItem(String id) {
//     setState(() {
//       todosList.removeWhere((item) => item.id == id);
//       _foundToDo.removeWhere((item) => item.id == id);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 167, 23, 13),
//         title: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: TextField(
//               onChanged: (value) => _runFilter(value),
//               decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.all(0),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: tdBlack,
//                   size: 20,
//                 ),
//                 prefixIconConstraints: BoxConstraints(
//                   minHeight: 20,
//                   minWidth: 25,
//                 ),
//                 border: InputBorder.none,
//                 hintText: 'Search',
//               ),
//             )),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             clipBehavior: Clip.none,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             child: Column(
//               children: [
//                 Flexible(
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     children: [
//                       if (_foundToDo.isEmpty)
//                         Center(
//                           child: Container(
//                             padding: const EdgeInsets.only(top: 80),
//                             child: const Text(
//                               'No Search Found',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       for (ToDo todoo in _foundToDo.reversed) ...[
//                         ToDoItem(
//                           todo: todoo,
//                           onToDoChanged: _handleToDoChange,
//                           onDeleteItem: _deleteToDoItem,
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
