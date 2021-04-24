import 'package:declutter_project/custom/color.dart';
import 'package:declutter_project/widgets/drawerBuild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFF914D),
      ),
      drawer: buildDrawerWidget(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.centerRight, colors: [
            kBlue,
            Color.lerp(Colors.pink, kBlue, 0.3),
          ]),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('My Wallet',
                    style: GoogleFonts.workSans(
                      color: kWhite,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  child: Stack(
                    children: [
                      Center(
                          child: Image.asset(
                        'assets/images/wallet.png',
                        height: 100,
                        width: 100,
                        color: kWhite,
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Hello,',
                      style: GoogleFonts.workSans(
                        fontSize: 25,
                        color: kWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Dennis Akagha!',
                      style: GoogleFonts.workSans(
                        fontSize: 25,
                        color: kWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 7),
              child: Container(
                // alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: kWhite,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'N2790',
                          style: GoogleFonts.workSans(
                            fontSize: 30,
                            color: kBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Available Fund',
                          style: GoogleFonts.workSans(
                            fontSize: 25,
                            color: kBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 15,
                      color: Colors.grey,
                      thickness: 1.8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/withdraw.png',
                                height: 30,
                                width: 30.0,
                                color: kBlue,
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                'Withdraw',
                                style: GoogleFonts.workSans(
                                  fontSize: 15,
                                  color: kBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text('Hello'),
                        Container(
                          height: 50,
                          width: 1.8,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/deposit.png',
                                height: 30,
                                width: 30.0,
                                color: kBlue,
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                'Deposit',
                                style: GoogleFonts.workSans(
                                  fontSize: 15,
                                  color: kBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 15,
                      color: Colors.grey,
                      thickness: 1.8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/transaction.png',
                                height: 35,
                                width: 35.0,
                                color: kBlue,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Transactions',
                                  style: GoogleFonts.workSans(
                                    fontSize: 15,
                                    color: kBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 1.8,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Icon(Icons.ac_unit_rounded),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Hello',
                                  style: GoogleFonts.workSans(
                                    fontSize: 15,
                                    color: kBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   showRow(String img, String img2, String text1, String text2) {
//     return Container(
//       //padding: EdgeInsets.all(10.0),
//       height: 100,
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 Image.network(
//                   img,
//                   height: 50,
//                   width: 50,
//                 ),
//                 Center(child: Text(text1, style: TextStyle(color: Colors.white),))
//               ],
//             ),
//           ),
//           Container(
//             height: 130,
//             width: 1.8,
//             color: Colors.grey,
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Image.network(
//                   img2,
//                   height: 50,
//                   width: 50,
//                 ),
//                 Center(child: Text(text2, style: TextStyle(color: Colors.white),))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.grey,
//       // ),

//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Colors.yellow,
//             Color.lerp(Colors.orange, Colors.yellow, 0.4),
//           ])
//         ),
//         padding:  EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.115)),
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 height: 110,
//                 width: 110,
//                 child: Stack(
//                   children: [
//                     Center(
//                         child: Image.network(
//                       'https://down.imgspng.com/download/0720/wallet_PNG7517.png',
//                       height: 100,
//                       width: 100,
//                     )),
//                     Center(child: Text('Wallet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             Text('Hello', ),
//             Text('James Cashman', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(

//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15)),
//                     gradient: LinearGradient(colors: [
//                       Color.lerp(Colors.black, Colors.blue, 0.6),
//                       Color.lerp(Colors.black, Colors.blue, 0.4)
//                     ])),
//                 child: Column(
//                   children: [
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(top:20.0),
//                         child: Text('790', style: TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),),
//                       ),
//                     ),
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 8.0),
//                         child: Text('Available Cash', style: TextStyle(color: Colors.white),),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     Divider(
//                       height: 15,
//                       color: Colors.grey,
//                       thickness: 1.8,
//                     ),
//                     showRow(
//                         'https://upload.wikimedia.org/wikipedia/commons/0/0c/Message_%28Send%29.png',
//                         'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Money_Flat_Icon.svg/640px-Money_Flat_Icon.svg.png',
//                         'Send Money',
//                         'Request'),
//                     Divider(
//                       height: 15,
//                       color: Colors.grey,
//                       thickness: 1.8,
//                     ),
//                     showRow(
//                         'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/640px-Hamburger_icon.svg.png',
//                         'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Green_asia_silver.png/640px-Green_asia_silver.png',
//                         'Transactions',
//                         'Reward Points'),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
