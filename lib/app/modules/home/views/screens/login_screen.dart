import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';
import 'package:soulee_project/app/modules/home/views/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final HomeController _authController = Get.find<HomeController>();
  final TextEditingController _emailController = TextEditingController(text: 'soulee@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // App logo or icon
                Icon(
                  Icons.person_outline,
                  size: 80,
                  color: Color(0xFFFF5A60),
                ),
                SizedBox(height: 32),

                // Title
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),

                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),

                // Error message if any
                if (_authController.error.value.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _authController.error.value,
                      style: TextStyle(color: Colors.red.shade800),
                    ),
                  ),

                // Email field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  enabled: !_authController.isLoading.value,
                ),
                SizedBox(height: 16),

                // Password field
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  obscureText: true,
                  enabled: !_authController.isLoading.value,
                ),
                SizedBox(height: 24),

                // Login button
                ElevatedButton(
                  onPressed: _authController.isLoading.value
                      ? null
                      : () => _login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF5A60),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _authController.isLoading.value
                      ? CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  )
                      : Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Auto-login button (for demo purposes)
                OutlinedButton(
                  onPressed: _authController.isLoading.value
                      ? null
                      : () => _authController.autoLogin(),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Color(0xFFFF5A60)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Auto Login (soulee@gmail.com)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFFF5A60),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () => Get.to(() => RegisterScreen()),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFFF5A60),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter both email and password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade800,
      );
      return;
    }

    //_authController.login(email, password);
  }
}
