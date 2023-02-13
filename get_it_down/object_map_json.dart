import 'dart:convert';

main(){

  Item itemObjeect=Item('uyu',true);
  Map itemAsMap=itemObjeect.toMap();
  String itemAsJson=json.encode(itemAsMap);
  //şimdi ise bu işlemleriniin tersini yapıtoruz
  itemAsMap=json.decode(itemAsJson);
  itemObjeect=Item(itemAsMap['title'], itemAsMap['isDone']);
}
class Item{
  String title;
  bool isDone;
  Item(this.title,this.isDone);
  Map<String,dynamic> toMap()=>{'title':title,'isDone':isDone};
}