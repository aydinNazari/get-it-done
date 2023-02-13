import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  String title;
  bool isDon;
  final Function(bool?) toggleStatus;
  final void Function(DismissDirection)? deletItem;
  ItemCard(this.title, this.isDon, this.toggleStatus, this.deletItem,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: deletItem,
      child: Card(
        elevation: isDon ? 1 : 5,
        color: isDon ? Colors.white : const Color(0xfff8f6f6),
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.bangers(
                color: Colors.black,
                decoration: isDon ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: toggleStatus,
            activeColor: Theme.of(context).primaryColor,
            value: isDon,
          ),
        ),
      ),
    );
  }
}
