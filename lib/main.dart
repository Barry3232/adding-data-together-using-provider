import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_grappler_using_provider/provider/data_provider.dart';
import 'package:word_grappler_using_provider/screens/first_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _data = 'Current Data';

  void updateDate(String newData) {
    setState(() {
      _data = newData;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DataProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Letter Accumulation',
      home: FirstScreen(),
    ),);
  }

}


  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider.value(
  //     value: DataProvider(),
  //     child: const MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'Letter accumulation',
  //       home: MyHomePage(),
  //     ),
  //   );
  // }
// }


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<DataProvider>(context, listen: true).data;
// //    final dataProd = Provider.of<DataProvider>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(),
//       body: ,
//     )
//   }
// }
//


