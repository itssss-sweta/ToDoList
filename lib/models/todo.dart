class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Learn', isDone: false),
      ToDo(id: '03', todoText: 'Go walk'),
      ToDo(id: '04', todoText: 'Meditate'),
    ];
  }
}
