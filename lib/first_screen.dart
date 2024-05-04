import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_grappler_using_provider/second_screen.dart';
import 'data_provider.dart';


class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    final data = dataProvider.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 35,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data)
                  ],
                )
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>SecondScreen())
                  );
                },
                child: const Text('Go to next Screen')
            ),
          ],
        ),
      ),
    );
  }
}