class Item {
  final String title;
  bool isDon;
  Item({required this.title, required this.isDon});
  void isToggleStatus() {
    isDon = !isDon;
  }
  Map<String,dynamic> toMap()=>{'title':title,'isDon':isDon};
}
