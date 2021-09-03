class Todo {
  String text;
  bool isDone;
  Todo({this.text = '', this.isDone = false});

  //with get storage
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        isDone: json['text'],
        text: json['text'],
      );
  Map<String, dynamic> toJson() => {
        'text': text,
        'done': isDone,
      };
}
