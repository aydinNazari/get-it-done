import 'package:flutter/material.dart';
import 'package:get_it_down/models/items_data.dart';
import 'package:get_it_down/screens/setting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widget/item_card.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setting(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings, size: 25),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            'Get It Done',
            style: GoogleFonts.sueEllenFrancisco(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '${Provider.of<ItemsData>(context).items.length} Items',
                    style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Consumer<ItemsData>(
                    builder: (context, itemData, child) => Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: itemData.items.length,
                          itemBuilder: (context, index) => ItemCard(
                            itemData.items[index].title,
                            itemData.items[index].isDon,
                            (bool) {
                              itemData.toggleStstus(index);
                            },
                            (bool) {
                              itemData.deletItem(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                context: context,
                builder: (context) => ItemAdder());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
