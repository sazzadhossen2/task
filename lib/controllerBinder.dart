import 'package:assign/presentation/state_holder/show_details_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(ShowDetailsController());
  }}