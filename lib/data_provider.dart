import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  String _data = '';
  String get data => _data;

  void updateData(String newData){
    _data = newData;
    notifyListeners();
  }
}
