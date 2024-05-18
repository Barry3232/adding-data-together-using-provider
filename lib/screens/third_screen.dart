import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import 'fourth_screen.dart';


class ThirdScreen extends StatelessWidget{
  ThirdScreen({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    final data = dataProvider.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: SingleChildScrollView(
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
                  dataProvider.updateData("$data$value");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){return FourthScreen();})
                  );
                },
              ),
            ),
            //
            // ElevatedButton(
            //     onPressed: () {
            //
            //     },
            //     child: const Text('Go to next Screen')
            // ),
          ],

        ),
      ),

    );

  }

}