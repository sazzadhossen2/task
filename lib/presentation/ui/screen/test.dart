import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmployeeManagerApp extends StatelessWidget {
  const EmployeeManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmployeeListScreen(),
    );
  }
}

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> _employees = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  Future<void> _fetchEmployees() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=12'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Employee> loadedEmployees = [];
      for (var item in data['results']) {
        loadedEmployees.add(Employee.fromJson(item));
      }
      setState(() {
        _employees = loadedEmployees;
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load employees');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _employees.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(_employees[i].name),
                subtitle: Text(_employees[i].email),
                trailing: Text(_employees[i].location),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          EmployeeDetailScreen(employee: _employees[i]),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${employee.name}'),
            Text('Email: ${employee.email}'),
            Text('Phone: ${employee.phone}'),
            Text('Location: ${employee.location}'),
            Text('Gender: ${employee.gender}'),
          ],
        ),
      ),
    );
  }
}

class Employee {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String gender;

  Employee({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.gender,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: '${json['name']['first']} ${json['name']['last']}',
      email: json['email'],
      phone: json['phone'],
      location: json['location']['country'],
      gender: json['gender'],
    );
  }
}
