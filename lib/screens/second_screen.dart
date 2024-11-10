import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:word_grappler_using_provider/screens/third_screen.dart';
import '../provider/data_provider.dart';

class SecondScreen extends StatelessWidget{
  SecondScreen({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    final data = dataProvider.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(130.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()
                  ),
                  controller: _controller,
                  maxLength: 1,
                  onChanged: (value){
                    LengthLimitingTextInputFormatter(1);
                    dataProvider.updateData(value);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){return ThirdScreen();})
                    );


                  },
                ),
              ),

              // ElevatedButton(
              //     onPressed: () {
              //
              //     },
              //     child: const Text('Go to next Screen')
              // ),
            ],

          ),
        ),
      ),

    );

  }
}