import 'package:get/get.dart';
import 'package:hapticadmin/common/common_controller/choicechip_controller.dart';
import 'package:hapticadmin/common/common_controller/dropdown_controller.dart';
import 'package:hapticadmin/common/common_controller/imagepicker_controller.dart';
import 'package:hapticadmin/datas/repositry/authentication_repository.dart';
import 'package:hapticadmin/datas/repositry/order_repositry.dart';
import 'package:hapticadmin/datas/repositry/user_repositry.dart';
import 'package:hapticadmin/featuers/notfication/controller/notifcationController.dart';
import 'package:hapticadmin/featuers/store/controllers/ordercontroller.dart';
import 'package:hapticadmin/featuers/store/controllers/sale_revenue_controller.dart';
import 'package:hapticadmin/featuers/store/controllers/serachcontroller.dart';
import 'package:hapticadmin/featuers/store/controllers/user_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.lazyPut(() => UserRepositry(), fenix: true);
    Get.lazyPut(() => OrderRepositry(), fenix: true);
    Get.lazyPut(() => Authenticationrepository(), fenix: true);

    // Controllers

    Get.lazyPut(() => Serachcontroller(), fenix: true);
    Get.lazyPut(() => Usercontroller(), fenix: true);
    Get.lazyPut(() => Dropdowncontroller(), fenix: true);
    Get.lazyPut(() => Imagepickercontroller(), fenix: true);
    Get.lazyPut(() => Choicechipcontroller());
    Get.lazyPut(() => Ordercontroller(), fenix: true);
    Get.lazyPut(() => Notifcationcontroller(), fenix: true);
    Get.lazyPut(() => Salesrevnecontroller(), fenix: true);
    Get.lazyPut(() => Salesrevnecontroller(), fenix: true);
    // Debug Line (Optional)
    print("Is OrderController Ready: ${Get.isRegistered<Ordercontroller>()}");
  }
}
