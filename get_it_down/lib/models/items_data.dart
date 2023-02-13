import 'dart:collection';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get_it_down/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemsData with ChangeNotifier {
  List<Item> _items = [];

  void toggleStstus(int index) {
    _items[index].isToggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    bool isDon = false;
    _items.add(Item(title: title, isDon: isDon));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deletItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  static SharedPreferences? _sharedPreferences;

  Future<void> creatPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  List<String> _itemAsString = [];

  void saveItemsToSharedPref(List<Item> Items) {
    _itemAsString.clear();

    for (var item in items) {
      _itemAsString.add(json.encode(item.toMap()));
    }
    _sharedPreferences?.setStringList('toDoData', _itemAsString);
  }

  void loadItemsFormSharedPref() {
    List<String>? tempList = _sharedPreferences?.getStringList('toDoData')??[];
    _items.clear();
    for (var item in tempList!) {
      var itemAsJson = json.decode(item);
      Item itemObject =
          Item(title: itemAsJson['title'], isDon: itemAsJson['isDon']);
      _items.add(itemObject);
    }
  }
}
