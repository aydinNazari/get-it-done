import 'dart:convert';

import 'object_map_json.dart';

main(){
  Item itemObject=new Item('uyu', true);
  Map itemAsMap=itemObject.toMap();
  //print(itemAsMap);
  String itemAsJson=json.encode(itemAsMap);
  //print(itemAsJson);
  //print('${itemAsJson.runtimeType}');


  //başa convert

  itemAsMap=json.decode(itemAsJson);
  itemObject=Item(itemAsMap['title'], itemAsMap['isDon']);
  print(itemObject);

}
class Item{
  String? title;
  bool? isDon;
  Item(this.title,this.isDon);
  Map<String,dynamic> toMap()=>{'title':title,'isDon':isDon};
}