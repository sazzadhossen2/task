import 'package:assign/presentation/ui/screen/show_employ_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmployDetails extends StatefulWidget {
  const AddEmployDetails({super.key});

  @override
  State<AddEmployDetails> createState() => _AddEmployDetailsState();
}

class _AddEmployDetailsState extends State<AddEmployDetails> {
  final TextEditingController _nameText = TextEditingController();
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _phoneText = TextEditingController();
  final TextEditingController _roleText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Center(child: Text("Add Employee")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _nameText,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Write your employee name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _emailText,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Write your employee email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _phoneText,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Write your employee phone number',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _roleText,
                decoration: InputDecoration(
                  labelText: 'Role',
                  hintText: 'Write your employee role',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Get.to(() =>
                      const EmployeeListScreen()); // Replace with your desired screen
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text("Next Screen")),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
