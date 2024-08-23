import 'package:dummy_project/login/model/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  RxList<Credential> credentials = <Credential>[
    Credential(name: 'user1', password: 'password1'),
    Credential(name: 'user2', password: 'password2'),
  ].obs;

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  bool authenticateUser(String username, String password) {
    for (var credential in credentials) {
      if (credential.name == username && credential.password == password) {
        return true;
      }
    }
    return false;
  }
}
