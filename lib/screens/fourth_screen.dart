import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/data_provider.dart';
import 'first_screen.dart';

class FourthScreen extends StatelessWidget{
  FourthScreen({super.key});
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: true);
    final data = dataProvider.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Screen'),
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
                  onChanged: (value)async{
                    LengthLimitingTextInputFormatter(1);
                    dataProvider.updateData("$data$value");
                    await dataProvider.insertDB({"word": "$data$value"});
                    // if(!mount)return;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>const FirstScreen())
                    );

                  },
                ),
              ),

              // ElevatedButton(
              //     onPressed: () {
              //
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