// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class TimerController extends GetxController {
//   RxInt remainingTime = 60.obs; // Reactive integer for the remaining time
//   RxBool isTimerRunning = true.obs; // Reactive boolean to check if timer is running
//   late Timer _timer;

//   @override
//   void onInit() {
//     super.onInit();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (remainingTime.value > 0) {
//         remainingTime.value--;
//       } else {
//         _timer.cancel();
//         isTimerRunning.value = false; // Stop the timer and show "Resend"
//       }
//     });
//   }

//   @override
//   void onClose() {
//     _timer.cancel(); // Don't forget to cancel the timer when the controller is disposed
//     super.onClose();
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TimerPage(),
//     );
//   }
// }

// class TimerPage extends StatelessWidget {
//   final TimerController controller = Get.put(TimerController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Timer Example'),
//       ),
//       body: Center(
//         child: Obx(() {
//           return controller.isTimerRunning.value
//               ? Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Your time remain: ${controller.remainingTime.value} seconds',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     SizedBox(height: 20),
//                     CircularProgressIndicator(), // Show a loading indicator
//                   ],
//                 )
//               : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Resend text', // After timer finishes
//                       style: TextStyle(fontSize: 20, color: Colors.green),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Resend action
//                       },
//                       child: Text('Resend'),
//                     ),
//                   ],
//                 );
//         }),
//       ),
//     );
//   }
// }
