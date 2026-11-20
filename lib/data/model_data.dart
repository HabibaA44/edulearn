//import 'package:flutter/widgets.dart';

//import 'package:flutter/widgets.dart';

class AppData {
  final User? user;
  final List<Category>? categories;
  final List<Exam>? exams;

  AppData({
    this.user,
    this.categories,
    this.exams,
  });

  factory AppData.fromJson(Map<String, dynamic> json) {
    return AppData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      categories: json['categories'] != null
          ? (json['categories'] as List).map((v) => Category.fromJson(v)).toList()
          : null,
      exams: json['exams'] != null
          ? (json['exams'] as List).map((v) => Exam.fromJson(v)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (user != null) 'user': user!.toJson(),
      if (categories != null) 'categories': categories!.map((v) => v.toJson()).toList(),
      if (exams != null) 'exams': exams!.map((v) => v.toJson()).toList(),
    };
  }
}

class User {
  final String? id;
  final String? name;
  final String? avatar;
  final DailyProgress? dailyProgress;

  User({
    this.id,
    this.name,
    this.avatar,
    this.dailyProgress,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      dailyProgress: json['dailyProgress'] != null
          ? DailyProgress.fromJson(json['dailyProgress'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
      if (dailyProgress != null) 'dailyProgress': dailyProgress!.toJson(),
    };
  }
}

class DailyProgress {
  final int? percentage;
  final String? message;
  final String? detail;

  DailyProgress({
    this.percentage,
    this.message,
    this.detail,
  });

  factory DailyProgress.fromJson(Map<String, dynamic> json) {
    return DailyProgress(
      percentage: json['percentage'],
      message: json['message'],
      detail: json['detail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (percentage != null) 'percentage': percentage,
      if (message != null) 'message': message,
      if (detail != null) 'detail': detail,
    };
  }
}

class Category {
  final String? color;
  final String? name;
  final String? icon;

  Category({
    this.color,
    this.name,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      color: json['color'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (color != null) 'color': color,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
    };
  }
}

class Exam {
  final String? id;
  final String? title;
  final String? course;
  final String? category;
  final String? thumbnail;
  final int? duration;
  final int? totalQuestions;
  final String? dueDate;
  final String? level;
  final String? levelColor;
  final String? status;
  final bool? certified;
  final int? passingScore;
  final int? passingCorrect;
  final String? questionType;
  final String? instructions;
  final String? warning;
  final List<Question>? questions;

  Exam({
    this.id,
    this.title,
    this.course,
    this.category,
    this.thumbnail,
    this.duration,
    this.totalQuestions,
    this.dueDate,
    this.level,
    this.levelColor,
    this.status,
    this.certified,
    this.passingScore,
    this.passingCorrect,
    this.questionType,
    this.instructions,
    this.warning,
    this.questions,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      title: json['title'],
      course: json['course'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      duration: json['duration'],
      totalQuestions: json['totalQuestions'],
      dueDate: json['dueDate'],
      level: json['level'],
      levelColor: json['levelColor'],
      status: json['status'],
      certified: json['certified'],
      passingScore: json['passingScore'],
      passingCorrect: json['passingCorrect'],
      questionType: json['questionType'],
      instructions: json['instructions'],
      warning: json['warning'],
      questions: json['questions'] != null
          ? (json['questions'] as List).map((v) => Question.fromJson(v)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (course != null) 'course': course,
      if (category != null) 'category': category,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (duration != null) 'duration': duration,
      if (totalQuestions != null) 'totalQuestions': totalQuestions,
      if (dueDate != null) 'dueDate': dueDate,
      if (level != null) 'level': level,
      if (levelColor != null) 'levelColor': levelColor,
      if (status != null) 'status': status,
      if (certified != null) 'certified': certified,
      if (passingScore != null) 'passingScore': passingScore,
      if (passingCorrect != null) 'passingCorrect': passingCorrect,
      if (questionType != null) 'questionType': questionType,
      if (instructions != null) 'instructions': instructions,
      if (warning != null) 'warning': warning,
      if (questions != null) 'questions': questions!.map((v) => v.toJson()).toList(),
    };
  }
}

class Question {
  final String? id;
  final int? questionNumber;
  final int? totalQuestions;
  final String? text;
  final List<Option>? options;
  final String? correctAnswer;

  Question({
    this.id,
    this.questionNumber,
    this.totalQuestions,
    this.text,
    this.options,
    this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionNumber: json['questionNumber'],
      totalQuestions: json['totalQuestions'],
      text: json['text'],
      options: json['options'] != null
          ? (json['options'] as List).map((v) => Option.fromJson(v)).toList()
          : null,
      correctAnswer: json['correctAnswer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (questionNumber != null) 'questionNumber': questionNumber,
      if (totalQuestions != null) 'totalQuestions': totalQuestions,
      if (text != null) 'text': text,
      if (options != null) 'options': options!.map((v) => v.toJson()).toList(),
      if (correctAnswer != null) 'correctAnswer': correctAnswer,
    };
  }
}

class Option {
  final String? id;
  final String? text;

  Option({
    this.id,
    this.text,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (text != null) 'text': text,
    };
  }
}