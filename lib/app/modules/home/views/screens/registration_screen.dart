// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:soulee_project/app/modules/home/controllers/home_controller.dart';
//
// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({super.key});
//
//   final HomeController _authController = Get.find<HomeController>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Obx(() {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Title
//                 Text(
//                   'Create Account',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//
//                 Text(
//                   'Sign up to get started',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey.shade600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 32),
//
//                 // Error message if any
//                 if (_authController.error.value.isNotEmpty)
//                   Container(
//                     padding: EdgeInsets.all(12),
//                     margin: EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade100,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       _authController.error.value,
//                       style: TextStyle(color: Colors.red.shade800),
//                     ),
//                   ),
//
//                 // Name field
//                 TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Full Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     prefixIcon: Icon(Icons.person_outline),
//                   ),
//                   enabled: !_authController.isLoading.value,
//                 ),
//                 SizedBox(height: 16),
//
//                 // Email field
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     prefixIcon: Icon(Icons.email_outlined),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   enabled: !_authController.isLoading.value,
//                 ),
//                 SizedBox(height: 16),
//
//                 // Password field
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     prefixIcon: Icon(Icons.lock_outline),
//                   ),
//                   obscureText: true,
//                   enabled: !_authController.isLoading.value,
//                 ),
//                 SizedBox(height: 24),
//
//                 // Register button
//                 ElevatedButton(
//                   onPressed: _authController.isLoading.value
//                       ? null
//                       : () => _register(),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFFF5A60),
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: _authController.isLoading.value
//                       ? CircularProgressIndicator(
//                     color: Colors.white,
//                     strokeWidth: 3,
//                   )
//                       : Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//
//                 // Login link
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Already have an account?"),
//                     TextButton(
//                       onPressed: () => Get.back(),
//                       child: Text(
//                         'Sign In',
//                         style: TextStyle(
//                           color: Color(0xFFFF5A60),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
//
//   void _register() {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//
//     if (name.isEmpty || email.isEmpty || password.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Please fill in all fields',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.shade100,
//         colorText: Colors.red.shade800,
//       );
//       return;
//     }
//
//     if (password.length < 6) {
//       Get.snackbar(
//         'Error',
//         'Password must be at least 6 characters',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.shade100,
//         colorText: Colors.red.shade800,
//       );
//       return;
//     }
//
//     //_authController.register(email, password, name);
//   }
// }
