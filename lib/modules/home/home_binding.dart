import 'package:exam2/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  }
}
//getbindings убираем репозиторий дальше импортируем