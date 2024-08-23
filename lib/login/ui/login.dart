import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dummy_project/login/controller/login_controller.dart';
import 'package:dummy_project/routes/routes.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/sarkar_logo.png'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) => controller.setUsername(value),
                decoration: const InputDecoration(
                  labelText: 'Enter the username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                onChanged: (value) => controller.setPassword(value),
                decoration: const InputDecoration(
                  labelText: 'Enter the password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Don't Have An Account? \t \t \tCreate Account "),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bool isAuthenticated = controller.authenticateUser(
                      controller.username.value,
                      controller.password.value,
                    );
                    if (isAuthenticated) {
                      Get.toNamed(route_name.HomeScreen);
                    } else {
                      Get.snackbar(
                        'Error',
                        'Invalid username or password',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  }
                },
                child: const Text("Proceed"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "By Tapping Proceed You Agree To Our",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              const Text(
                "Terms And Conditions",
                style: TextStyle(color: Colors.blue, fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
