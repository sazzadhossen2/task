import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_employ_details.dart';

class AddEmploy extends StatelessWidget {
  const AddEmploy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/img.png",
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You are the only one here',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'You have no employees working for you',
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Get.to(() =>
                      const AddEmployDetails()); // Replace with your desired screen
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Icon(Icons.add)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
