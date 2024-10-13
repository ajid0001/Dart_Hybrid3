import 'dart:convert';
import 'package:hybrid3/students.dart';

void main() {
  String json = '''
[
  {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
  {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
  {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
  {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
]
''';

  // List<Map<String, String>> people = jsonDecode(json);

  // List<Map<String, String>> people =
  //     List<Map<String, String>>.from(jsonDecode(json));

  List<dynamic> decodedList = jsonDecode(json);
  // List<Map<String, String>> people = decodedList.cast<Map<String, String>>();

  List<Map<String, String>> people = List<Map<String, String>>.from(
      decodedList.map((person) => Map<String, String>.from(person)));

  Students students = Students(people);

  print('Sorted by first name:');
  students.sort('first');
  students.output();

  print("....");
  print('Added John Doe:');
  students.plus({
    "first": "John",
    "last": "Doe",
    "email": "johndoe0001@algonquinlive.com"
  });
  students.output();

  print("....");
  print('Removed first name "Steve":');
  students.remove('Steve');
  students.output();
}
