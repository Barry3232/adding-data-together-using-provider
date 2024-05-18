import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_grappler_using_provider/provider/data_provider.dart';

class RecordScreen extends StatefulWidget{
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {

  bool _isLoading = true;

  void fetchData(){
    Provider.of<DataProvider>(context, listen: false).fetchData().then((_) =>
      setState(()
      {
        _isLoading = false;
      }

    )).onError((error, stackTrace) => print(error));


  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final wordList = dataProvider.wordList;
     return Scaffold(
       body: SafeArea(
           child: _isLoading? const Center(child: SizedBox(width: 100, height: 100,child: CircularProgressIndicator()),)
                              : ListView.builder(itemBuilder: (context, index)=>   Text(wordList[index]["word"]),
    itemCount: wordList.length,
    ),
     ),
     );
  }
}