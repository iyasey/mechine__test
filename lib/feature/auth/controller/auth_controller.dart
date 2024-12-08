import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mechine___test/feature/auth/services/auth_services.dart';
import 'package:mechine___test/feature/auth/model/user_model.dart';
import 'package:mechine___test/feature/categories/services/todo_services.dart';
import 'package:mechine___test/feature/categories/view/pages/categories_page.dart';

class AuthController extends GetxController {
  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await AuthServices.signUp(email: email, password: password, name: name);
      final userDetails = AuthServices.getcurrentUser();
      final user = UserModel(id: userDetails!.uid, name: name, email: email);
      await TodoServices.createUser(user);
      Get.snackbar('success', 'SignUp successful');

      Get.offAll(() => CategoriesPage(userId: userDetails.uid,));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await AuthServices.logout();
      Get.snackbar("success", "Logout sucessfull");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await AuthServices.signIn(email, password);
      Get.snackbar("Sucess", "Signin sucessfull");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Stream<List<UserModel>> getUserStream() {
  //   return TodoServices.getUserStream();
  // }

  User? getCurrentUser() {
    try {
      return AuthServices.getcurrentUser();
    } catch (e) {
      Get.snackbar("Error", "Cannot get current user");
    }
    return null;
  }
}
