import 'package:exam2/modules/home/home_binding.dart';
import 'package:exam2/modules/home/home_page.dart';
import 'package:get/get.dart';
part './routes.dart';
//гетпэйджсроутс
abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding())
  ];
}
