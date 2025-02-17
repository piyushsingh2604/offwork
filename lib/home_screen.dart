import 'package:flutter/material.dart';

///// textfiled and number validation
// class HomeController extends GetxController {
//   // Reactive variable to control the visibility of the error message
//   RxBool isHide = false.obs;
//   TextEditingController test = TextEditingController();

//   // Function to check input length and show error if less than 10
//   void checkInputLength(String val) {
//     if (val.length < 10) {
//       isHide.value = true; // Show error if input length is less than 10
//     } else {
//       isHide.value = false; // Hide error if input length is 10 or more
//     }
//   }

//   // Function to validate the input when the button is pressed
//   void validateInput() {
//     if (test.text.isEmpty || test.text.length < 10) {
//       isHide.value = true; // Show error if input is empty or less than 10 digits
//     } else {
//       isHide.value = false; // Hide error if input is valid
//     }
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HomeController()); // Initialize the controller

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: 60,
//               child: TextFormField(
//                 controller: controller.test,
//                 onChanged: (val) {
//                   controller.checkInputLength(val); // Check input length on text change
//                 },
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: const Color.fromARGB(120, 158, 158, 158),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//             // Using Obx to listen for changes in isHide
//             Obx(() => Visibility(
//                   visible: controller.isHide.value,
//                   child: Text(
//                     "Please enter 10 digits",
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 )),
//             ElevatedButton(
//               onPressed: () {
//                 controller.validateInput(); // Validate input when the button is pressed
//               },
//               child: Text("check"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////////////////

//// number in star

// class SecondScreen extends StatelessWidget {
//   final String phoneNumber;

//   SecondScreen({required this.phoneNumber});

//   @override
//   Widget build(BuildContext context) {
//     // Replace middle 6 digits with stars
//     String formattedNumber =
//         phoneNumber.substring(0, 2) + '*' * 6 + phoneNumber.substring(8, 10);

//     return Scaffold(
//       appBar: AppBar(title: Text('Second Screen')),
//       body: Center(
//         child: Text(
//           'Formatted Number: $formattedNumber',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }




///////
//timer counter

