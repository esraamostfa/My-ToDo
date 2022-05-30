import 'package:equatable/equatable.dart';

class Task extends Equatable {
  late String id;
  late String title;
  String? details;
  String? date;
  String? time;
  late bool isCompleted;
  late bool isArchived;

  Task(
      {required this.id,
      required this.title,
      this.details,
      this.date,
      this.time,
      this.isCompleted = false,
      this.isArchived = false});

  Task copyWith(
      {String? id,
      String? title,
      String? details,
      String? date,
      String? time,
      bool? isCompleted,
      bool? isArchived}) {
    return Task(
        id: id?? this.id,
        title: title ?? this.title,
        details: details ?? this.details,
        time: time ?? this.time,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted,
        isArchived: isArchived ?? this.isArchived);
  }

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    date = json['date'];
    time = json['time'];
    isCompleted = json['isCompleted'];
    isArchived = json['isArchived'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'details': details,
        'date': date,
        'time': time,
        'isCompleted': isCompleted,
        'isArchived': isArchived
      };

  @override
  List<Object?> get props =>
      [id, title, details, time, date, isCompleted, isArchived];
}
