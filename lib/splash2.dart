// import 'package:flutter/material.dart';
// import 'package:stics/login.dart';
// import 'package:stics/splash.dart';
// import 'package:lottie/lottie.dart';

// class Splash2 extends StatefulWidget {
//   @override
//   _Splash2State createState() => _Splash2State();
// }

// class _Splash2State extends State<Splash2> with TickerProviderStateMixin {
//   PageController _pageController;

//   AnimationController rippleController;
//   AnimationController scaleController;

//   Animation<double> rippleAnimation;
//   Animation<double> scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _pageController = PageController(initialPage: 0);

//     rippleController =
//         AnimationController(vsync: this, duration: Duration(seconds: 1));

//     scaleController =
//         AnimationController(vsync: this, duration: Duration(seconds: 1))
//           ..addStatusListener(
//             (status) {
//               if (status == AnimationStatus.completed) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Login()),
//                 );
//               }
//             },
//           );

//     rippleAnimation =
//         Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
//           ..addStatusListener((status) {
//             if (status == AnimationStatus.completed) {
//               rippleController.reverse();
//             } else if (status == AnimationStatus.dismissed) {
//               rippleController.forward();
//             }
//           });

//     scaleAnimation =
//         Tween<double>(begin: 1.0, end: 30.0).animate(scaleController);

//     rippleController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[200],
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red[300],
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Splash(),
//             ),
//           );
//         },
//         child: Icon(
//           Icons.arrow_back_ios_rounded,
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Card(
//               clipBehavior: ,
//               child: Image(
//                 width: 500,
//                 image: AssetImage(
//                   'assets/girl.cheering.png',
//                 ),
//               ),
//             ),

//             Spacer(),
//             // Padding(
//             //   padding: const EdgeInsets.all(20.0),
//             //   child: Card(
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(30.0),
//             //     ),
//             //     elevation: 5,
//             //     color: Colors.white,
//             //     shadowColor: Colors.red[200],
//             //     child: Padding(
//             //       padding: const EdgeInsets.all(10.0),
//             //       child:
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Text(
//                 'We pair kids from all over the world for them to share ideas, emotions and experiences',
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//                 //     ),
//                 //   ),
//                 // ),
//               ),
//             ),
//             Spacer(),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: AnimatedBuilder(
//                 animation: rippleAnimation,
//                 builder: (context, child) => Container(
//                   width: rippleAnimation.value,
//                   height: rippleAnimation.value,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.red[200].withOpacity(.6)),
//                     child: InkWell(
//                       onTap: () {
//                         scaleController.forward();
//                       },
//                       child: AnimatedBuilder(
//                         animation: scaleAnimation,
//                         builder: (context, child) => Transform.scale(
//                           scale: scaleAnimation.value,
//                           child: Container(
//                             margin: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.red[200],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 50,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
