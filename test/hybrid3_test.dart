import 'dart:convert';
import 'package:hybrid3/hybrid3.dart';
import 'package:test/test.dart';
import 'package:hybrid3/students.dart';



void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('Students', () {
    String json = '''
[
  {"first": "Adam", "last": "Robillard", "email": "robilla@algonquincollege.com"},
  {"first": "Adesh", "last": "Shah", "email": "shaha@algonquincollege.com"},
  {"first": "Steve", "last": "Griffith", "email": "griffis@algonquincollege.com"},
  {"first": "Tony", "last": "Davidson", "email": "davidst@algonquincollege.com"},
  {"first": "John", "last": "Doe", "email": "johndoe0001@algonquinlive.com"}
]
''';

    // Decode the JSON and convert it to a List<Map<String, String>>
    List<dynamic> decodedList = jsonDecode(json);
    List<Map<String, String>> people = List<Map<String, String>>.from(
        decodedList.map((person) => Map<String, String>.from(person)));

    // Create an instance of Students
    Students students = Students(people);

    // Sort by 'first' name
    students.sort('first');
    expect(students.people[0]['first'], 'Adam');
    expect(students.people[1]['first'], 'Adesh');
    expect(students.people[2]['first'], 'John');
    expect(students.people[3]['first'], 'Steve');
    expect(students.people[4]['first'], 'Tony');

    // Add a new student
    students.plus({
      "first": "Jane",
      "last": "Doe",
      "email": "janedoe0002@algonquinlive.com"
    });
    expect(students.people[5]['first'], 'Jane');

    // Remove 'Steve'
    students.remove('Steve');
    expect(students.people.any((person) => person['first'] == 'Steve'), false);
  });
}
