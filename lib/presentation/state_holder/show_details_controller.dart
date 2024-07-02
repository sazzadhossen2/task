import 'package:get/get.dart';
import '../../data/model/employModel.dart';
import '../../data/model/responce_data.dart';
import '../../data/service/network_coller.dart';

class ShowDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _isError = " ";

  String get isError => _isError;
  EmployeeModel _employeeModel = EmployeeModel();

  EmployeeModel get employeeModel => _employeeModel;

  Future<bool> getNew() async {
    bool isSuccess = true;
    _inProgress = true;
    update();
    final ResponceData responceData = await NetworkCaller()
        .getRequest("https://randomuser.me/api/?results=12");
    _inProgress = false;
    if (responceData.isSuccess) {
      _employeeModel = EmployeeModel.fromJson(responceData.responceData);
      isSuccess = true;
    } else {
      _isError = responceData.isError;
      isSuccess = false;
    }
    update();
    return isSuccess;
  }
}
