import 'dart:math';

import 'package:dart_prac1/Models/Student.dart';

class StudentList {
  List<Student> studentsList = [];

  void addStudent(Student student){
    studentsList.add(student);
  }

  Student? getStudentWithHighestGrade(){
    if (studentsList.isEmpty){
        return null;
    }

    var studentWithHighestGrade = studentsList.reduce((a, b) => a.grade! > b.grade! ? a : b);

    return studentWithHighestGrade;
  }

  double? getAverageGrade(){
    if (studentsList.isEmpty){
      return null;
    }

    var totalGrade = studentsList
        .map((student) => student.grade!)
        .reduce((a, b) => a + b);

    var averageGrade = totalGrade / studentsList.length;

    return averageGrade;
  }

  void fillStudents() {

    for (var i = 1 ; i <= 20 ; i++) {
      Student student = Student()
        ..id = i
        ..surname = i.toString()
        ..middle = i.toString()
        ..firstName = i.toString()
        ..age = i
        ..group = i.toString()
        ..grade = generateDouble(1, 5, 4);
      addStudent(student);
    }
  }

  double? generateDouble(double minValue, double maxValue, int precision) {
    final random = Random();
    final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
    return double.parse(doubleRandom.toStringAsFixed(precision));
  }

  void deleteStudentById(int id) {
    studentsList.removeAt(id);
  }

  void editStudent(Student student) {
    studentsList.removeAt(student.id!.toInt());
    studentsList.insert(student.id!.toInt(), student);
  }

  List<Student>? getAllStudents() {
    if (studentsList == null) {
      return null;
    }
    return studentsList;
  }

  void printStudents(List<Student>? students) {
    if (students == null) {
      print("Cannot find students");
    }
    for(var student in students!) {
      print('${[student.id,
        student.surname,
        student.middle,
        student.firstName,
        student.age,
        student.group,
        student.grade]}');
    }
  }

  List<Student>? getSortedStudents(String field, var value) {
    if (value is int) {
      List<Student> sortedStudents = switch(field) {
        'id' => studentsList.elementAt(value),
        'age' => studentsList.where((element) => element.age == value),
        // TODO: Handle this case.
        String() => null
      } as List<Student>;
      return sortedStudents;
    }
    else if (value is double) {
      List<Student> sortedStudents = switch(field) {
        'grade' => studentsList.where((element) => element.grade == value),
      // TODO: Handle this case.
        String() => null
      } as List<Student>;
      return sortedStudents;
    }
    else if (value is String) {
      List<Student> sortedStudents = switch(field) {
        'surname' => studentsList.where((element) => element.surname == value),
        'middle' => studentsList.where((element) => element.middle == value),
        'firstName' => studentsList.where((element) => element.firstName == value),
        'group' => studentsList.where((element) => element.group == value),
      // TODO: Handle this case.
        String() => null
      } as List<Student>;
      return sortedStudents;
    }
    else {
      return null;
    }
  }
}