import 'package:get/get.dart';
import 'package:mechine___test/feature/categoriesdetails/model/detail_model.dart';
import 'package:mechine___test/feature/categoriesdetails/services/detail_services.dart';

class DetailController extends GetxController {
  final DetailServices _todoService = DetailServices();

  var detail = <DetailModel>[].obs;

   void fetchDetails(String userId, String todoId) {
    _todoService.getDetails(userId, todoId).listen((detailsList) {
      detail.value = detailsList;
    });
  }
  Future<void> addDetails(String userId, String todoId, String task) async {
    try {
      final details = DetailModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        task: task,
        createdAt: DateTime.now(),
      );
      await _todoService.addDetail(userId, todoId, details);
    } catch (e) {
      Get.snackbar('Error', 'Failed to add comment: $e');
    }
  }


}
