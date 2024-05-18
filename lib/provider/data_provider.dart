import 'package:flutter/cupertino.dart';

import '../services/database_sevices.dart';

class DataProvider extends ChangeNotifier {
  String _data = '';
  List<Map<String, dynamic>> wordList = [];
  String get data => _data;

  Future<void> updateData(String newData) async {
    _data = newData;
    notifyListeners();
  }
  Future<void> insertDB(Map<String, dynamic> word){
    return DataBaseServices.insert("words_db", word);
  }

  Future<void> fetchData()async{
   try{
     final words = await DataBaseServices.getData("words_db");
     wordList = words;
     notifyListeners();
   }catch(e){
     print("fetching data error: $e}");
   }
  }
}
