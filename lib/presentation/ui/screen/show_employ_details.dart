import 'package:assign/presentation/state_holder/show_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/show_detail.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ShowDetailsController>().getNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      body: GetBuilder<ShowDetailsController>(builder: (detailsControl) {
        return Visibility(
          visible: detailsControl.inProgress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employees (${detailsControl.employeeModel.results?.length ?? 0})',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        detailsControl.employeeModel.results?.length ?? 0,
                    itemBuilder: (context, index) {
                      return EmployeeCard(
                          employee:
                              detailsControl.employeeModel.results![index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
