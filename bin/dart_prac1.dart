import 'dart:convert';
import 'dart:io';

import 'package:dart_prac1/Models/Student.dart';
import 'package:dart_prac1/StudentList.dart';
import 'package:dart_prac1/dart_prac1.dart' as dart_prac1;

void main(List<String> arguments) {
  StudentList studentList = new StudentList();

  studentList.fillStudents();

  while(true) {
    print("Students : ");
    studentList.printStudents(studentList.getAllStudents());

    print("Select a function\n"
        "1 - Get student with highest grade;\n"
        "2 - Get average grade;\n"
        "3 - Edit student;\n"
        "4 - Delete student;\n"
        "5 - Sort students.\n");

    int function = int.parse(stdin.readLineSync(encoding: utf8)!.trim());
    stdin.readLineSync(encoding: utf8); //Очистка буфера
    switch(function) {
      case 1:
        print("Student with highest grade : ");
        Student? highestGradeStudent = studentList.getStudentWithHighestGrade();
        List<Student> highestGradeStudentList = [];
        highestGradeStudentList.add(highestGradeStudent!);
        studentList.printStudents(highestGradeStudentList);
        break;
      case 2:
        print("Average grade : ");
        print(studentList.getAverageGrade());
        break;
      case 3:
        stdout.write("Select student id to edit : \n");
        studentList.printStudents(studentList.getAllStudents());
        int id = int.parse(stdin.readLineSync(encoding: utf8)!.trim());
        /*stdin.readLineSync(encoding: utf8); //Очистка буфера*/
        if (id <= studentList.studentsList.length + 1 && id >= 1) {
          if (studentList.studentsList.elementAt(id) != null) {
            Student student = studentList.studentsList.elementAt(id + 1);
            var editing = true;
            while (editing) {
              List<Student> currStudentList = [];
              currStudentList.add(student);
              studentList.printStudents(currStudentList);
              print("Select field to edit\n"
                  "(surname), (middle), (firstName), (age), (group), (grade)");
              var field = stdin.readLineSync(encoding: utf8)!.trim();
              stdin.readLineSync(encoding: utf8); //Очистка буфера
              switch (field) {
                case 'surname':
                  print("Insert value : ");
                  var value = stdin.readLineSync(encoding: utf8)!.trim();
                  stdin.readLineSync(encoding: utf8); //Очистка буфера
                  if (value != null) {
                    student.surname = value;
                    print('$value added');
                  }
                  else {
                    print("Cannot add null value.");
                  }
                  break;
                case 'middle':
                  print("Insert value : ");
                  var value = stdin.readLineSync(encoding: utf8)!.trim();
                  stdin.readLineSync(encoding: utf8); //Очистка буфера
                  if (value != null) {
                    student.middle = value;
                    print('$value added');
                  }
                  else {
                    print("Cannot add null value.");
                  }
                  break;
                case 'firstName':
                  print("Insert value : ");
                  var value = stdin.readLineSync(encoding: utf8)!.trim();
                  stdin.readLineSync(encoding: utf8); //Очистка буфера
                  if (value != null) {
                    student.firstName = value;
                    print('$value added');
                  }
                  else {
                    print("Cannot add null value.");
                  }
                  break;
                case 'age':
                  print("Insert value : ");
                  var value = stdin.readLineSync(encoding: utf8)!.trim();
                  stdin.readLineSync(encoding: utf8); //Очистка буфера
                  if (value != null) {
                    student.age = int.tryParse(value);
                    print('$value added');
                  }
                  else {
                    print("Cannot add null value.");
                  }
                  break;
                case 'group':
                  print("Insert value : ");
                  var value = stdin.readLineSync(encoding: utf8)!.trim();
                  stdin.readLineSync(encoding: utf8); //Очистка буфера
                  if (value != null) {
                    student.group = value;
                    print('$value added');
                  }
                  else {
                    print("Cannot add null value.");
                  }
                  break;
                case 'grade':
                  print("Insert value : ");
                  var value = stdin.readLineSync(encoding: utf8)!.trim();
                  stdin.readLineSync(encoding: utf8); //Очистка буфера
                  if (value != null) {
                    student.grade = double.tryParse(value);
                    print('$value added');
                  }
                  else {
                    print("Cannot add null value.");
                  }
                  break;
              }

              print("Finish editing? (y/n)");
              var finish = stdin.readLineSync(encoding: utf8)!.trim();
              stdin.readLineSync(encoding: utf8); //Очистка буфера
              if (finish == null) {
                print("Cannot read command");
              }
              if (finish == 'y') {
                studentList.editStudent(student);
                editing = false;
              } else if (finish != 'n') {
                print("Cannot read command");
              }
            }
          }
          else {
            print("Student does not exists");
          }
        }
        else {
          print("Cannot read id");
        }
        break;
      case 4:
        print ("Select student id to delete : ");
        studentList.printStudents(studentList.getAllStudents());
        int id = int.parse(stdin.readLineSync(encoding: utf8)!.trim());
        stdin.readLineSync(encoding: utf8); //Очистка буфера
        if (id == studentList.studentsList.length + 1) {
          if (studentList.studentsList.elementAt(id) != null) {
            studentList.deleteStudentById(id);
            Student student = studentList.studentsList.elementAt(id);
            var name = student.firstName;
            print('$name student has deleted.');
          }
          else {
            print("Student does not exists");
          }
        }
        else {
          print("Cannot read id");
        }
        break;
      case 5:
        print("Select field to sort\n"
            "(surname), (middle), (firstName), (age), (group), (grade)");
        var field = stdin.readLineSync(encoding: utf8)!.trim();
        stdin.readLineSync(encoding: utf8); //Очистка буфера
        if (field == 'surname'
            || field == 'middle'
            || field == 'firstName'
            || field == 'age'
            || field == 'group'
            || field == 'grade'
                && field != null) {
          print("Insert value to sort");
          var value = stdin.readLineSync(encoding: utf8)!.trim();
          stdin.readLineSync(encoding: utf8); //Очистка буфера
          if (value != null) {
            studentList.printStudents(studentList.getSortedStudents(field, value));
          }
          else {
            print("Cannot sort with null value");
          }
        }
        else {
          print("Cannot find a field");
        }
        break;
    }
  }
}



